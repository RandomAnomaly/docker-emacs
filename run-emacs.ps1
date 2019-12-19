$docker_build_command = 'docker build . --tag docker-emacs'
$docker_run_command = 'docker run --volume=./emacs-config:/home/emacs-user/emacs-config -it docker-emacs'

iex $docker_build_command
iex $docker_run_command