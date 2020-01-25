FROM ubuntu

RUN apt-get update && apt-get install -y bash emacs git gcc

RUN addgroup appgroup && adduser emacs-user --ingroup appgroup
USER emacs-user

COPY ./emacs-config/Settings.org /home/emacs-user/

CMD emacs