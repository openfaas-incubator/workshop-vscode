# workshop-vscode

OpenFaaS Workshop with in-browser version of VSCode

All tools are pre-installed with OpenFaaS on Kubernetes (k3s) available in the browser terminal.

## Steps to provision on DigitalOcean

* [Get 100 USD free credit for 60 days](https://m.do.co/c/8d4e75e9886f)
* Create a DigitalOcean VM size 4GB RAM in your local region
* Add "user data" from `cloudinit.txt`
* Pick "ssh" login or via root password over email
* Locate the public IP given and navigate to `http://IP:8443`
* You may have to wait 1-2 mins for the endpoint to come up
* Open a Terminal within VSCode and run through the files in ~/project/openfaas/
* Next start the workshop from [Lab 2](https://github.com/openfaas/workshop#lab-2---test-things-out)

## VSCode Docker image

Docker image: alexellis2/coder:0.2.0

See also [Dockerfile](./Dockerfile)

## Debugging

* Log into instance `ssh root@IP`
* View the cloudinit logs:

```
tail -f /var/log/cloud-init-output.log
```


