Param(
    [Parameter(HelpMessage = "Type of deployment (CD or Publish)", Mandatory = $true)]
    [ValidateSet('CD','Publish')]
    [string] $Publishing_Stategy = "CD",
    [Parameter(HelpMessage = "fat or prod", Mandatory = $false)]
    [ValidateSet('PROD*','FAT*')]
    [string] $Environmet_deployment

)


$secret_value_string =""
if ($Publishing_Stategy -eq "CD"){
    $secret_value_string="QA"
}else {
    if($Environmet_deployment -eq "PROD*"){
        $secret_value_string="PROD"}
    elseif ($Environmet_deployment -eq "FAT*") {
        $secret_value_string="FAT"
    }
}

Write-Output $secret_value_string