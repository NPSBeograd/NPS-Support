Param(
    [Parameter(HelpMessage = "The GitHub token running the action", Mandatory = $true)]
    [string] $Token,
    [Parameter(HelpMessage = "Type of deployment (CD or Publish)", Mandatory = $true)]
    [ValidateSet('CD', 'Publish')]
    [string] $Publishing_Stategy = "CD",
    [Parameter(HelpMessage = "Name of environment to deploy to", Mandatory = $true)]
    [string] $Environmet_name,
    [Parameter(HelpMessage = "fat or prod", Mandatory = $false)]
    [string] $Environmet_deployment
)

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass


Install-PackageProvider -Name NuGet -Force

New-Item -Path "./LibSodiumNuget" -ItemType Directory

nuget install libsodium -OutputDirectory "./LibSodiumPackage" -ExcludeVersion

Write-Host "Importing libSodium Library"
Add-Type @"
    using System;
    using System.Runtime.InteropServices;

    public class LibSodium {
        [DllImport("libsodium.dll", CallingConvention = CallingConvention.Cdecl)]
        public static extern int sodium_init();
    }
"@

Add-Type @"
    using System;
    using System.Runtime.InteropServices;

    public static class Sodium {
        [DllImport("libsodium.dll", CallingConvention = CallingConvention.Cdecl)]
        public static extern int crypto_box_seal(byte[] ciphertext, byte[] message, ulong messageLength, byte[] publicKey);

        public static byte[] SealedPublicKeyBoxCreate(byte[] message, byte[] publicKey) {
            if (message == null) {
                throw new ArgumentNullException("message");
            }
            if (publicKey == null) {
                throw new ArgumentNullException("publicKey");
            }

            byte[] ciphertext = new byte[message.Length + crypto_box_sealbytes()];
            int result = crypto_box_seal(ciphertext, message, (ulong)message.Length, publicKey);
            if (result != 0) {
                throw new InvalidOperationException("SealedPublicKeyBox creation failed.");
            }
            return ciphertext;
        }

        [DllImport("libsodium.dll", CallingConvention = CallingConvention.Cdecl)]
        private static extern int crypto_box_sealbytes();
}
"@


[LibSodium]::sodium_init()

Write-Host "LibSodium is imported"
Add-Type -AssemblyName System.Threading.Tasks
Add-Type -AssemblyName System.Security

$url_public_key = "  https://api.github.com/repos/NPSBeograd/NPS-Support/actions/secrets/public-key"
$header = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$header.Add("Authorization", "Bearer $token")
$header.Add("Accept", "application/vnd.github+json")
$header.Add("X-Github-Api-Version", "2022-11-28")

$response_public_key = Invoke-RestMethod -Method Get -Uri $url_public_key -Headers $header

Write-Host "Getting public key from repository"
$key = $response_public_key.key
$key_id = $response_public_key.key_id

$secret_value_string = ""
if ($Publishing_Stategy -eq "CD") {
    $secret_value_string = "qa"
}
else {
    if ($Environmet_deployment -eq "PROD*") {
        $secret_value_string = "prod"
    }
    elseif ($Environmet_deployment -eq "FAT*") {
        $secret_value_string = "fat"
    }

}


#$prod_auth= [System.Text.Encoding]::UTF8.GetBytes("PROD_AUTHCONTEXT")


$secret_value_bytes = [System.Text.Encoding]::UTF8.GetBytes($secret_value_string)
$decoded_public_key = [System.Convert]::FromBase64String($key)
Write-Host "Encoding public key"


$sealedPublicKeyBox = [Sodium]::SealedPublicKeyBoxCreate($secret_value_bytes, $decoded_public_key)
$sealedPublicKeyBoxBase64 = [System.Convert]::ToBase64String($sealedPublicKeyBox)

Write-Host "Sealding Secret Box"

$url_secret = " https://api.github.com/repos/NPSBeograd/NPS-Support/actions/secrets/$($Environmet_name)_ENVIRONMENTNAME"
$body = @{"encrypted_value" = $sealedPublicKeyBoxBase64
    "key_id"                = "$key_id"
} | ConvertTo-Json

Write-Host "Creating Secret"

Invoke-RestMethod -Method Put -Uri $url_secret -Body $body -Headers $header

Write-Host "Secret is created"