$docker_build_command = 'docker build . --tag docker-emacs'
$docker_run_command = "docker run --rm -e DISPLAY=host.docker.internal:0.0 --volume=$pwd/:/home/emacs-user/docker-emacs-repo --volume=$pwd/working-directory:/home/emacs-user/source --volume=$pwd/emacs-config/.emacs.d:/home/emacs-user/.emacs.d --volume=$HOME/.ssh:/home/emacs-user/.ssh --volume=$HOME/dev/gitlab.com:/home/emacs-user/gitlab.com -ti docker-emacs"


echo $docker_run_command
iex $docker_build_command
iex $docker_run_command