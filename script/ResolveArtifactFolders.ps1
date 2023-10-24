Param (
    [string] $BusinessCentralLocalization,
    [string] $TravelOrder,
    [string] $Manufacturing,
    [string] $EIN,
    [string] $HrmPayroll,
    [string] $EinLoc,
    [string] $Translation
)




$repositoriesMap = @(@{"Business-Central-Localization" = $BusinessCentralLocalization },
    @{"Electronic-Invoicing" = $EIN },
    @{"Manufacturing-Management" = $Manufacturing },
    @{"Travel-Order" = $TravelOrder },
    @{"HRM-and-Payroll" = $HrmPayroll },
    @{"CON_EIN_NPSLoc" = $EinLoc },
    @{"Serbian-Translation-W1" = $Translation }
)

$ExtToInstall= @()


for ([int] $i = 0; $i -lt $repositoriesMap.Count; $i++) {

    if ($repositoriesMap[$i].values[0] -eq "true") {
        $ExtToInstall+= $repositoriesMap[$i].Keys[0]
    }
}

$ResolvedArtifactFoldersJson = ConvertTo-Json -InputObject $ExtToInstall -compress
Add-Content -Encoding UTF8 -Path $env:GITHUB_OUTPUT -Value "ResolvedArtifactFoldersJson=$ResolvedArtifactFoldersJson"