$jsonFilePath = ".github/AL-Go-Settings.json"

# Read the JSON content from the file
$jsonContent = Get-Content -Path $jsonFilePath | ConvertFrom-Json

Write-Output $jsonContent.environments[0]