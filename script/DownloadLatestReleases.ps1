Param (
    [string] $Repository,
    [string] $token
)


$header = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$header.Add("Authorization", "Bearer $token")
$header.Add("X-Github-Api-Version", "2022-11-28")
$header.Add("Accept", "")



$donwloadFolder =  $ENV:GITHUB_WORKSPACE

$url = "https://api.github.com/repos/NPSBeograd/$Repository/releases/latest"
$header["Accept"] = "application/vnd.github+json"


$latestRelease = Invoke-RestMethod -Uri $url -Headers $header

# Select the first asset in the list
$firstAsset = $latestRelease.assets[0]

# Get the download URL of the first asset
$assetUrl = "https://api.github.com/repos/NPSBeograd/$Repository/releases/assets/$($firstAsset.id)"
$filePath= $("$donwloadFolder/$Repository/$Repository.zip")
Write-Host " Downloading Repository $Repository asset"
Write-Host "Asset url: " $assetUrl
Write-Host "File path: $filePath"
# Download the first asset
$header["Accept"] = "application/octet-stream"
Invoke-WebRequest -Uri $assetUrl -OutFile $filePath  -Headers $header -Method Get

ls $donwloadFolder
$downloadName = "$Repository.zip"

Add-Content -Encoding UTF8 -Path $env:GITHUB_OUTPUT -Value "DownloadedArtifactName=$downloadName"

Write-Host "Downloading Completed in folder $donwloadFolder..."
