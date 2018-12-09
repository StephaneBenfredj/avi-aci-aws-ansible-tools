#avi-ansible-dockerimage

```
docker build -t stefb12/avi-aci-aws-ansible-tools:latest .
```


```
docker run -it --name my-avi-aci-aws-ansible -v YourLocalFolder:/ws stefb12/avi-aci-aws-ansible-tools:latest
```

note on pip requirements: 
lxml and xmljson are required for ACI