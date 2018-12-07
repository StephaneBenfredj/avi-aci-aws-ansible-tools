# Ansible setup for Avi Networks built from Ubuntu 16.04
# version: 1.5

# TO DO 
#  add volume statement to map to /tmp ?
#  optimize size (currently 670MB ...)
#  add ENV 

FROM ubuntu:16.04
LABEL maintainer="stefb12@gmail.com"

#RUN echo 'installing some useful packages:' 
#RUN echo 'dialog apt-utils software-properties-common' 
#RUN echo 'python-pip python-dnspython (needed for DNS lookups with ansible) python-netaddr' 
#RUN echo 'vim net-tools'
#RUN echo 'inetutils-ping git ssh-client'

RUN apt-get update && apt-get install -y \
	apt-utils \
	dialog \
	inetutils-ping \
	net-tools \
	python-pip \
	python-dnspython \
	python-netaddr \
	software-properties-common \
	ssh-client \
	vim

#RUN echo 'adding ppa repository for ansible to get latest version and install ansible ...' 
RUN apt-add-repository -y ppa:ansible/ansible && apt-get update && apt-get install -y ansible \
&& rm -rf /var/lib/apt/lists/*

# if you dont add PPA repository, then old version of ansible get installed
# best practice from docker is to clean up the apt cache by removing /var/lib/apt/lists 
# reduces the image size (saves 39M in my test)

#RUN echo 'upgrading pip ...' 
RUN pip install --upgrade pip

#RUN echo 'installing pip modules from requirements'
ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt


#no longer needed
#RUN echo 'get Avi fork of ansible-modules-extras ...' 
#RUN mkdir -p /etc/ansible/library && cd /etc/ansible/library
#RUN git clone https://github.com/avinetworks/avi_ansible_modules.git

## install avisdk role
#RUN echo 'installing avidsk role ...'
RUN ansible-galaxy install avinetworks.avisdk

## install aviconfig role 
#RUN echo 'installing aviconfig role ...'
RUN ansible-galaxy install avinetworks.aviconfig

## below items are not needed to run playbooks on existing avi install 
RUN ansible-galaxy install avinetworks.avicontroller
## RUN ansible-galaxy install avinetworks.avise
## RUN ansible-galaxy install avinetworks.docker



