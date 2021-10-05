FROM jupyter/minimal-notebook
MAINTAINER James Hepworth <james@opusmeum.dev>

USER root

# Install vim and ssh
RUN apt-get update
RUN apt-get install -y vim openssh-client

WORKDIR /tmp

COPY ./ jupyter_c_kernel/

RUN pip install --no-cache-dir -e jupyter_c_kernel/ > piplog.txt
RUN cd jupyter_c_kernel && install_c_kernel --user > installlog.txt

WORKDIR /home/$NB_USER/

USER $NB_USER
