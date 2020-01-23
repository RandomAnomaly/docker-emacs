FROM ubuntu

RUN apt-get update
RUN apt-get install -y bash
RUN apt-get install -y emacs

RUN addgroup appgroup && adduser emacs-user --ingroup appgroup
USER emacs-user

COPY ./emacs-config/Settings.org /home/emacs-user/

RUN mkdir /home/emacs-user/.emacs.d
COPY ./emacs-config/init.el /home/emacs-user/.emacs.d/

CMD emacs