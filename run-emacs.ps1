$docker_build_command = 'docker build . --tag docker-emacs'
$docker_run_command = "docker run --rm -e DISPLAY=host.docker.internal:0.0 --volume=$pwd/emacs-config:/home/emacs-user/emacs-config-live-edit -ti docker-emacs"


echo $docker_run_command
iex $docker_build_command
iex $docker_run_command