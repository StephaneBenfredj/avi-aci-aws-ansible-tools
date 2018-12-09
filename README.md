#avi-ansible-dockerimage

## docker build
```
docker build -t stefb12/avi-aci-aws-ansible-tools:latest .
```

## docker run
```
docker run -it --name my-avi-aci-aws-ansible -v YourLocalFolder:/ws stefb12/avi-aci-aws-ansible-tools:latest
```

## note on pip requirements
lxml and xmljson are required for ACI when using XML payload with aci_rest module