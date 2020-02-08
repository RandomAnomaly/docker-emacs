FROM ubuntu:19.10

SHELL [ "/bin/bash", "-l", "-c" ]

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
	bash=5.0-4ubuntu1 \
	emacs=1:26.3+1-1ubuntu1 \
	git=1:2.20.1-2ubuntu1.19.10.1\
	gcc=4:9.2.1-3.1ubuntu1\
	python3=3.7.5-1\
	python3-pip=18.1-5 \
	libpython3.7-dev \
	python3-setuptools && \
	rm -rf /var/lib/apt/lists/*

RUN addgroup appgroup && adduser emacs-user --ingroup appgroup
USER emacs-user

RUN echo 'export PATH="$PATH:/usr/bin"' >> ~/.bashrc

RUN pip3 install jupyterlab
ENV PATH $PATH:/home/emacs-user/.local/bin

RUN pip3 install python-language-server[all]==0.31.7

# Downgrade jedi, currently needed for LSP
RUN pip3 uninstall -y jedi && pip3 install jedi==0.15.0

USER root
RUN apt-get update && \
	apt-get install -y curl=7.65.3-1ubuntu3 && \
	curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n && \
	bash n lts

RUN npm install -g dockerfile-language-server-nodejs
RUN apt-get update && apt-get install -y ledger
USER emacs-user

RUN jupyter notebook --generate-config
RUN echo "c.NotebookApp.ip = '127.0.0.1'" >> /home/emacs-user/.jupyter/jupyter_notebook_config.py

USER root
#RUN apt-get update && apt-get install -y ruby-full build-essential zlib1g-dev
#RUN apt-get update && apt-get install -y wget
#RUN wget https://rubygems.org/rubygems/rubygems-3.1.2.tgz
#RUN tar xvfz rubygems-3.1.2.tgz
RUN apt-get install -y gnupg2
RUN gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN bash /etc/profile.d/rvm.sh
RUN /etc/profile.d/rvm.sh
USER emacs-user

RUN git config --global user.email "spiffyRAM@gmail.com"
RUN git config --global user.name "Jack Christopher Gammon"

COPY ./emacs-config/Settings.org /home/emacs-user/
CMD emacs
