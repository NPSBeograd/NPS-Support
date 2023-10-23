Param(
    [string] $EnvironmentName,
    [string] $ResolvedEnvironmentName
)

# Path to the JSON file
$jsonFilePath = ".github/AL-Go-Settings.json"

# Read the JSON content from the file
$jsonContent = Get-Content -Path $jsonFilePath | ConvertFrom-Json


# Check if 'environments' property exists, if not, create it as an empty array
if (-not $jsonContent.PSObject.Properties["environments"]) {
    $jsonContent | Add-Member -MemberType NoteProperty -Name environments -Value @()
}

# Add a new string to the 'environments' array
$jsonContent.environments += "$EnvironmentName ($ResolvedEnvironmentName)"

# Write the modified JSON content back to the file
$jsonContent | ConvertTo-Json | Set-Content -Path $jsonFilePath
 

