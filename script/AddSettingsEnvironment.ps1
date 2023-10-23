Param(
    [string] $EnvironmentName,
    [string] $ResolvedEnvironmentName
)


# Path to the JSON file
$jsonFilePath = ".github/AL-Go-Settings.json"

# Read the JSON content from the file
$jsonContent = Get-Content -Path $jsonFilePath | ConvertFrom-Json

# Modify the JSON content (for example, add a new property)
$jsonContent.environments = "$EnvironmentName ($ResolvedEnvironmentName)"

# Write the modified JSON content back to the file
$jsonContent | ConvertTo-Json | Set-Content -Path $jsonFilePath