Param(
    [string] $EnvironmentName,

    [ValidateSet('','PROD*','FAT*')]
    [string] $Environmet_deployment=""
)


$secret_value_string =""
if ($Environmet_deployment -eq ""){
    $secret_value_string="QA"
}else {
    if($Environmet_deployment -eq "PROD*"){
        $secret_value_string="PROD"}
    elseif ($Environmet_deployment -eq "FAT*") {
        $secret_value_string="FAT"
    }
}

# Path to the JSON file
$jsonFilePath = ".github/AL-Go-Settings.json"

# Read the JSON content from the file
$jsonContent = Get-Content -Path $jsonFilePath | ConvertFrom-Json


# Check if 'environments' property exists, if not, create it as an empty array
if (-not $jsonContent.PSObject.Properties["environments"]) {
    $jsonContent | Add-Member -MemberType NoteProperty -Name environments -Value @()
}

# Add a new string to the 'environments' array
$jsonContent.environments += "$EnvironmentName ($secret_value_string)"

# Write the modified JSON content back to the file
$jsonContent | ConvertTo-Json | Set-Content -Path $jsonFilePath
 

