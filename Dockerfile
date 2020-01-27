FROM ubuntu

RUN apt-get update && apt-get install -y bash emacs git gcc python3 python3-pip

RUN addgroup appgroup && adduser emacs-user --ingroup appgroup
USER emacs-user

RUN echo 'export PATH="$PATH:/usr/bin"' >> ~/.bashrc

RUN pip3 install jupyterlab
ENV PATH $PATH:/home/emacs-user/.local/bin

RUN pip3 install python-language-server[all]

# Downgrade jedi, currently needed for LSP
RUN pip3 uninstall -y jedi && pip3 install jedi==0.15.0

USER root
RUN apt-get update && apt-get install -y curl && curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n && bash n lts
RUN npm install -g dockerfile-language-server-nodejs
USER emacs-user



COPY ./emacs-config/Settings.org /home/emacs-user/
CMD emacs