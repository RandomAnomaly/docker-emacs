$docker_build_command = 'docker build . --tag docker-emacs'

$docker_settings_file_path = "./docker-settings.js"
$jsondata = Get-Content -Raw -Path $docker_settings_file_path | ConvertFrom-Json
$volumes = ""
$environment_variables = ""

$git_user_name = ""
$git_email = ""

foreach ($setting in $jsondata."docker-settings") {
    if($setting.type -eq "directoryMap"){
        $source = $setting.source
        $destination = $setting.destination
        $volume_string = "--volume $source`:$destination"
        $volumes = $volumes + $volume_string + " "
    } elseif($setting.type -eq "environmentVariable") {
        $key = $setting.key
        $value = $setting.value
        $environment_variable_string = "-e $key=$value"
        $environment_variables = $environment_variables + $environment_variable_string + " "
    } elseif($setting.type -eq "gitGlobalConfig"){
        $key = $setting.key
        $value = $setting.value

        if($key -eq "user.name"){
            $git_user_name = $value
        } elseif($key -eq "user.email"){
            $git_email = $value
        }
    }
}

$docker_run_command = "docker run " + $volumes + $environment_variables + "-it docker-emacs"

iex $docker_build_command
iex $docker_run_command