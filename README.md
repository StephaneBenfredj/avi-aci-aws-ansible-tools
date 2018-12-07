#avi-ansible-dockerimage


docker build -t stefb12/avi-aci-aws-ansible-tools:latest .

docker run -it --name my-avi-aci-aws-ansible -v <yourlocalfolder>:/ws stefb12/avi-aci-aws-ansible-tools:latest