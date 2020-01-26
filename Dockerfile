FROM ubuntu

RUN apt-get update && apt-get install -y bash emacs git gcc python3 python3-pip

RUN addgroup appgroup && adduser emacs-user --ingroup appgroup
USER emacs-user

RUN echo 'export PATH="$PATH:/usr/bin"' >> ~/.bashrc

RUN pip3 install jupyterlab
ENV PATH $PATH:/home/emacs-user/.local/bin

COPY ./emacs-config/Settings.org /home/emacs-user/
CMD emacs