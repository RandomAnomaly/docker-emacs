FROM ubuntu

RUN apt-get update
RUN apt-get install -y bash
RUN apt-get install -y emacs

RUN addgroup appgroup && adduser emacs-user --ingroup appgroup
USER emacs-user

COPY ./emacs-config/Settings.org /home/emacs-user/

CMD emacs