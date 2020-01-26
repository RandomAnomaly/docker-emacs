FROM ubuntu

RUN apt-get update && apt-get install -y bash emacs git gcc python3 python3-pip

RUN addgroup appgroup && adduser emacs-user --ingroup appgroup
USER emacs-user

COPY ./emacs-config/Settings.org /home/emacs-user/

RUN echo 'PATH="$PATH:/usr/bin"' >> ~/.bashrc

RUN pip3 install jupyterlab
RUN echo 'PATH="$PATH:/home/emacs-user/.local/bin/"' >> ~/.bashrc

CMD emacs