Param (
    [string] $BusinessCentralLocalization,
    [string] $TravelOrder,
    [string] $Manufacturing,
    [string] $EIN,
    [string] $HrmPayroll,
    [string] $EinLoc,
    [string] $Translation,
    [string] $token
)

$repositoriesMap = @{"Business-Central-Localization" = $BusinessCentralLocalization
    "Electronic-Invoicing"                           = $EIN
    "Manufacturing-Management"                       = $Manufacturing
    "Travel-Order"                                   = $TravelOrder
    "HRM-and-Payroll"                                = $HrmPayroll
    "CON_EIN_NPSLoc"                                 = $EinLoc
    "Serbian-Translation-W1"                         = $Translation
}
$header=New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$header.Add("Authorization", "Bearer $token")
$header.Add("X-Github-Api-Version", "2022-11-28")
$header.Add("Accept","")
function Get-Assets {
    Param (
        [string] $RepositoryName
    )

    $donwloadFolder = Join-Path $ENV:GITHUB_WORKSPACE ".artifacts"
    $url = "https://api.github.com/repos/NPSBeograd/$RepositoryName/releases/latest"
    $header["Accept"]= "application/vnd.github+json"

    $latestRelease = Invoke-RestMethod -Uri $url -Headers $header

    # Select the first asset in the list
    $firstAsset = $latestRelease.assets[0]

    # Get the download URL of the first asset
    $assetUrl = $firstAsset.browser_download_url

    Write-Host "Asset url: " $assetUrl
    # Download the first asset
    $header["Accept"]= "application/octet-stream"
    Invoke-WebRequest -Uri $assetUrl -OutFile  $donwloadFolder -Headers $header -Method Get
}

foreach ($repositorieMap in $repositoriesMap.Keys){

    if([bool]$repositoriesMap[$repositorieMap]){
        Get-Assets -RepositoryName $repositorieMap
    }
}

