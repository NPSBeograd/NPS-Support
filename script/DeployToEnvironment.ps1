


try {
    . (Join-Path -Path $PSScriptRoot -ChildPath ".\AL-Go-Helper.ps1" -Resolve)
    DownloadAndImportBcContainerHelper

    $type = $Env:type
    $environmentName= $Env:environmentName
    $artifacts= $Env:artifacts
    $token= $Env:token
    $deploymentEnvironments = $Env:deploymentEnvironmentsJson | ConvertFrom-Json | ConvertTo-HashTable -recurse
    $deploymentSettings = $deploymentEnvironments."$environmentName"
    $envName = $environmentName.Split(' ')[0]
    $secrets = $env:Secrets | ConvertFrom-Json

    # Check obsolete secrets
    "$($envName)-EnvironmentName","$($envName)_EnvironmentName","EnvironmentName" | ForEach-Object {
        if ($secrets."$_") {
            throw "The secret $_ is obsolete and should be replaced by using the EnvironmentName property in the DeployTo$envName setting in .github/AL-Go-Settings.json instead"
        }
    }
    if ($secrets.Projects) {
        throw "The secret Projects is obsolete and should be replaced by using the Projects property in the DeployTo$envName setting in .github/AL-Go-Settings.json instead"
    }

    $authContext = $null
    foreach($secretName in "$($envName)-AuthContext","$($envName)_AuthContext","AuthContext") {
        if ($secrets."$secretName") {
            $authContext = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($secrets."$secretName"))
        }
    }
    if (-not $authContext) {
        # No AuthContext secret provided, if deviceCode is present, use it - else give an error
        if ($env:deviceCode) {
            $authContext = "{""deviceCode"":""$($env:deviceCode)""}"
        }
        else {
            throw "No Authentication Context found for environment ($environmentName). You must create an environment secret called AUTHCONTEXT or a repository secret called $($envName)_AUTHCONTEXT."
        }
    }

    $artifacts = $artifacts.Replace('/',([System.IO.Path]::DirectorySeparatorChar)).Replace('\',([System.IO.Path]::DirectorySeparatorChar))

    $apps = @()
   

    if ($artifacts -like "$($ENV:GITHUB_WORKSPACE)*") {
       
                $apps += @((Get-ChildItem -Path $artifacts ) | ForEach-Object { $_.FullName })
    }
        elseif (Test-Path $artifacts) {
            $apps = $artifacts
        }
        else {
            throw "Artifact $artifacts was not found. Make sure that the artifact files exist and files are not corrupted."
        }
    }catch {
        Write-Host "$_"
    }
  



    Write-Host "Apps to deploy"
    $apps | Out-Host

    Set-Location $ENV:GITHUB_WORKSPACE

    $customScript = Join-Path $ENV:GITHUB_WORKSPACE ".github/DeployTo$($deploymentSettings.EnvironmentType).ps1"
    if (Test-Path $customScript) {
        Write-Host "Executing custom deployment script $customScript"
        $parameters = @{
            "type" = $type
            "AuthContext" = $authContext
            "Apps" = $apps
        } + $deploymentSettings
        . $customScript -parameters $parameters
    }
    else {
        try {
            $authContextParams = $authContext | ConvertFrom-Json | ConvertTo-HashTable
            $bcAuthContext = New-BcAuthContext @authContextParams
            if ($null -eq $bcAuthContext) {
                throw "Authentication failed"
            }
        } catch {
            throw "Authentication failed. $([environment]::Newline) $($_.exception.message)"
        }

        Write-Host "$($bcContainerHelperConfig.baseUrl.TrimEnd('/'))/$($bcAuthContext.tenantId)/$($deploymentSettings.EnvironmentName)/deployment/url"
        $response = Invoke-RestMethod -UseBasicParsing -Method Get -Uri "$($bcContainerHelperConfig.baseUrl.TrimEnd('/'))/$($bcAuthContext.tenantId)/$($deploymentSettings.EnvironmentName)/deployment/url"
        if ($response.Status -eq "DoesNotExist") {
            OutputError -message "Environment with name $($deploymentSettings.EnvironmentName) does not exist in the current authorization context."
            exit
        }
        if ($response.Status -ne "Ready") {
            OutputError -message "Environment with name $($deploymentSettings.EnvironmentName) is not ready (Status is $($response.Status))."
            exit
        }

        try {
            $sandboxEnvironment = ($response.environmentType -eq 1)
            if ($sandboxEnvironment -and !($bcAuthContext.ClientSecret)) {
                # Sandbox and not S2S -> use dev endpoint (Publish-BcContainerApp)
                $parameters = @{
                    "bcAuthContext" = $bcAuthContext
                    "environment" = $deploymentSettings.EnvironmentName
                    "appFile" = $apps
                }
                if ($deploymentSettings.SyncMode) {
                    if (@('Add','ForceSync', 'Clean', 'Development') -notcontains $deploymentSettings.SyncMode) {
                        throw "Invalid SyncMode $($deploymentSettings.SyncMode) when deploying using the development endpoint. Valid values are Add, ForceSync, Development and Clean."
                    }
                    Write-Host "Using $($deploymentSettings.SyncMode)"
                    $parameters += @{ "SyncMode" = $deploymentSettings.SyncMode }
                }
                Write-Host "Publishing apps using development endpoint"
                Publish-BcContainerApp @parameters -useDevEndpoint -checkAlreadyInstalled -excludeRuntimePackages
            }
            elseif (!$sandboxEnvironment -and $type -eq 'CD' -and !($deploymentSettings.ContinuousDeployment)) {
                # Continuous deployment is undefined in settings - we will not deploy to production environments
                Write-Host "::Warning::Ignoring environment $($deploymentSettings.EnvironmentName), which is a production environment"
            }
            else {
                # Use automation API for production environments (Publish-PerTenantExtensionApps)
                $parameters = @{
                    "bcAuthContext" = $bcAuthContext
                    "environment" = $deploymentSettings.EnvironmentName
                    "appFiles" = $apps
                }
                if ($deploymentSettings.SyncMode) {
                    if (@('Add','ForceSync') -notcontains $deploymentSettings.SyncMode) {
                        throw "Invalid SyncMode $($deploymentSettings.SyncMode) when deploying using the automation API. Valid values are Add and ForceSync."
                    }
                    Write-Host "Using $($deploymentSettings.SyncMode)"
                    $syncMode = $deploymentSettings.SyncMode
                    if ($syncMode -eq 'ForceSync') { $syncMode = 'Force' }
                    $parameters += @{ "SchemaSyncMode" = $syncMode }
                }
                Write-Host "Publishing apps using automation API"
                Publish-PerTenantExtensionApps @parameters
            }
        }
        catch {
            OutputError -message "Deploying to $environmentName failed.$([environment]::Newline) $($_.Exception.Message)"
            exit
        }
    }





