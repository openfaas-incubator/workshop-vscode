# workshop-vscode

OpenFaaS Workshop with in-browser version of VSCode

All tools are pre-installed with OpenFaaS on Kubernetes (k3s) available in the browser terminal.

## How it works

1) A Virtual Machine will be provisioned with a cloud hosting provider using cloudinit
2) Kubernetes with k3s will be installed on the VM
3) OpenFaaS will be installed into the k3s cluster
4) A Docker image will be run which provides VSCode via a web-browser
5) The login password for VSCode will be obtained via `ssh`
6) VSCode can now be used in web-browser via your VM's IP. The self-signed certificate will provide encryption and the login password will protect against tampering.

## Steps to provision on DigitalOcean

* [Get 100 USD free credit for 60 days](https://m.do.co/c/8d4e75e9886f)
* Create a DigitalOcean VM size 4GB RAM in your local region
* Add "user data" from `cloudinit.txt`
* Pick "ssh" login or via root password over email
* Locate the public IP given and navigate to `https://IP:8443`
* You will need to accept the self-signed certificate, which will display as "insecure". Despite the warning, it will provide encryption for your connection.
* You may have to wait for several minutes before the endpoint to comes up. See the second on Debugging if you want to check the logs.
* Open a Terminal within VSCode and run through the files in ~/project/openfaas/
* Next start the workshop from [Lab 2](https://github.com/openfaas/workshop#lab-2---test-things-out)

## Get your password

Get the container's logs with:

```sh
export IP=""
ssh root@$IP "docker logs vscode | grep password"

INFO  Password: 7d6ae6958e8d7e882ba08f57
```

> Note: the password shown is an example, you will have your own password.

## Debug / get the cloudinit logs

* Log into instance `ssh root@IP`
* View the logs for cloudinit

Either run `/root/logs.sh` or `tail -f /var/log/cloud-init-output.log`

## VSCode Docker image

Docker image: alexellis2/coder:0.2.0

See also [Dockerfile](./Dockerfile)


