Param(
    [Parameter(HelpMessage = "The GitHub token running the action", Mandatory = $true)]
    [string] $Token,
    [Parameter(HelpMessage = "Type of deployment (CD or Publish)", Mandatory = $true)]
    [ValidateSet('CD','Publish')]
    [string] $Publishing_Stategy = "CD",
    [Parameter(HelpMessage = "Name of environment to deploy to", Mandatory = $true)]
    [string] $Environmet_name,
    [Parameter(HelpMessage = "fat or prod", Mandatory = $false)]
    [string] $Environmet_deployment
)

Install-PackageProvider -Name NuGet -Force
New-Item -Path "./LibSodiumNuget" -ItemType Directory
nuget install libsodium -OutputDirectory "./LibSodiumPackage" -ExcludeVersion

# Path to the DLL inside the LibSodiumPackage folder
$libsodiumPath = Join-Path (Get-Location) "LibSodiumPackage/libsodium.dll"

# Load the DLL
Add-Type -TypeDefinition @"
   using System;
   public class LibSodium {
      [DllImport("$libsodiumPath", CallingConvention=CallingConvention.Cdecl)]
      public static extern int sodium_init();
      // Add other function declarations as needed
   }
"@ -Language CSharp

# Initialize libsodium
[LibSodium]::sodium_init()
Add-Type -AssemblyName System.Threading.Tasks
Add-Type -AssemblyName System.Security

$url_public_key= "  https://api.github.com/repos/NPSBeograd/NPS-Support/actions/secrets/public-key"
$header=New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$header.Add("Authorization", "Bearer $token")
$header.Add("Accept", "application/vnd.github+json")
$header.Add("X-Github-Api-Version", "2022-11-28")

$response_public_key=Invoke-RestMethod -Method Get -Uri $url_public_key -Headers $header
$key=$response_public_key.key
$key_id=$response_public_key.key_id

$secret_value_string =""
if ($Publishing_Stategy -eq "CD"){
    $secret_value_string="qa"
}else {
    if($Environmet_deployment -eq "PROD*"){
        $secret_value_string="prod"}
    elseif ($Environmet_deployment -eq "FAT*") {
        $secret_value_string="fat"
    }

}


$prod_auth= [System.Text.Encoding]::UTF8.GetBytes("PROD_AUTHCONTEXT")


$secret_value_bytes = [System.Text.Encoding]::UTF8.GetBytes($secret_value_string)
$decoded_public_key = [System.Convert]::FromBase64String($key)

$sealedPublicKeyBox = [LibSodium.SealedPublicKeyBox]::Create($secret_value_bytes, $decoded_public_key)
$sealedPublicKeyBoxBase64 = [System.Convert]::ToBase64String($sealedPublicKeyBox)

$url_secret=" https://api.github.com/repos/NPSBeograd/NPS-Support/actions/secrets/$($Environmet_name)_ENVIRONMENTNAME"
$body=@{"encrypted_value"= $sealedPublicKeyBoxBase64
        "key_id"         = $key_id
        }

Invoke-RestMethod -Method Put -Uri $url_secret -Body $body -Headers $header