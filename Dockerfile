FROM alpine:3.9.4

RUN apk update
RUN apk add bash=4.4.19-r1
RUN apk add emacs=26.1-r0

RUN addgroup -S appgroup && adduser -S emacs-user -G appgroup
USER emacs-user

COPY ./emacs-config/Settings.org /home/emacs-user/

RUN mkdir /home/emacs-user/.emacs.d
COPY ./emacs-config/init.el /home/emacs-user/.emacs.d/

CMD emacs
