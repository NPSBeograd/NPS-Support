Param(
    [Parameter(HelpMessage = "The GitHub token running the action", Mandatory = $true)]
    [string] $token,
    [Parameter(HelpMessage = "Specifies the parent telemetry scope for the telemetry signal", Mandatory = $false)]
    [string] $parentTelemetryScopeJson = '7b7d',
    [Parameter(HelpMessage = "Name of environment to deploy to", Mandatory = $true)]
    [string] $environmentName,
    [Parameter(HelpMessage = "Artifacts to deploy", Mandatory = $true)]
    [string] $artifacts,
    [Parameter(HelpMessage = "Type of deployment (CD or Publish)", Mandatory = $false)]
    [ValidateSet('CD','Publish')]
    [string] $Publishing_Stategy = "CD",
    [Parameter(HelpMessage = "The settings for all Deployment Environments", Mandatory = $true)]
    [string] $Environmet_name,
    [Parameter(HelpMessage = "fat or prod", Mandatory = $true)]
    [ValidateSet('PROD*','FAT*')]
    [string] $Environmet_deployment
)

sudo apt-get install mono-complete
sudo apt-get install nuget

nuget install libsodium

dotnet nuget locals global-packages --list

$version= ls /home/runner/.nuget/packages/libsodium


Expand-Archive -Path "/home/runner/.nuget/packages/libsodium/$version/libsodium.$($version).nupkg" -DestinationPath "LibSodiumPackage"
Add-Type -Path "./LibSodiumPackage/lib/netstandard2.0/Sodium.Core.dll"
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

$sealedPublicKeyBox = [Sodium.SealedPublicKeyBox]::Create($secret_value_bytes, $decoded_public_key)
$sealedPublicKeyBoxBase64 = [System.Convert]::ToBase64String($sealedPublicKeyBox)

$url_secret=" https://api.github.com/repos/NPSBeograd/NPS-Support/actions/secrets/$($Environmet_name)_ENVORONMENTNAME"
$body=@{"encrypted_value"= $sealedPublicKeyBoxBase64
        "key_id"         = $key_id
        }

Invoke-RestMethod -Method Put -Uri $url_secret -Body $body -Headers $header