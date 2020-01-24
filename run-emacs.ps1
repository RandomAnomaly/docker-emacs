$docker_build_command = 'docker build . --tag docker-emacs'
$docker_run_command = "docker run --rm -e DISPLAY=host.docker.internal:0.0 --volume=$pwd/emacs-config:/home/emacs-user/emacs-config-live-edit --volume=$pwd/working-directory:/home/emacs-user/source --volume=$pwd/emacs-config/.emacs.d:/home/emacs-user/.emacs.d -ti docker-emacs"


echo $docker_run_command
iex $docker_build_command
iex $docker_run_command