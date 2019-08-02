# workshop-vscode

OpenFaaS Workshop with in-browser version of VSCode from [coder.com](https://coder.com)

All tools are pre-installed with OpenFaaS on Kubernetes (k3s) available in the browser terminal.

## How it works

1) A Virtual Machine will be provisioned with a cloud hosting provider using cloudinit
2) [Kubernetes](https://kubernetes.io/) with [k3s](https://k3s.io/) will be installed on the VM
3) [OpenFaaS](https://www.openfaas.com/) will be installed into the k3s cluster
4) A Docker image will be run which provides [VSCode](https://k3s.io/) via a web-browser
5) The login password for VSCode will be obtained via `ssh`
6) VSCode can now be used in web-browser via your VM's IP. The self-signed certificate will provide encryption and the login password will protect against tampering.

## Why do we need this?

This project provides a pre-installed Kubernetes environment within a VM so that your students can focus on your workshop.

The example in this repository is for [The OpenFaaS Workshop](https://github.com/openfaas/workshop). It is estimated that it would save students 1.5-2 hours of set-up time. Instructors could also pre-provision a set amount of VMs ahead of time and then give out IP address and password combinations.

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

## Steps to provision on Civo

* [Get 50 USD credits for new sign-ups](https://bit.ly/2Lx9d2o)
* Create a Medium sized VM and get your login details
* `cloudinit` is not available on Civo at this time, but you can log in after the VM is ready and run the script manually instead
* Use `ssh` to connect to the instance, now paste in the content from `cloudinit.txt` into your terminal
* You will need to accept the self-signed certificate, which will display as "insecure". Despite the warning, it will provide encryption for your connection.
* You may have to wait for several minutes before the endpoint to comes up. See the second on Debugging if you want to check the logs.
* Open a Terminal within VSCode and run through the files in ~/project/openfaas/
* Next start the workshop from [Lab 2](https://github.com/openfaas/workshop#lab-2---test-things-out)


## Get your password

Get the container's logs with:

```sh
export IP=""
ssh root@$IP "docker logs vscode | grep Password"

INFO  Password: 7d6ae6958e8d7e882ba08f57
```

> Note: the password shown is an example, you will have your own password.

## Debug / get the cloudinit logs

* Log into instance `ssh root@IP`
* View the logs for cloudinit

Either run `/root/logs.sh` or `tail -f /var/log/cloud-init-output.log`

## Automation

Setup a VM using a script in the London region:

```sh
# ./provision-digitalocean.sh

Creating: of-workshop-ebddfcaf
==============================
Droplet: of-workshop-ebddfcaf has been created
IP: 178.128.42.184
URL: https://178.128.42.184:8443
Login: ssh root@178.128.42.184
==============================
To destroy this droplet run: doctl compute droplet delete -f 150218836

```

You'll be emailed the root password, which you can use to log in and get the VSCode password.

## Customize for your own workshops and training sessions

There are two parts you can customize:

* The Docker image: `alexellis2/coder:0.2.0`, which is built from [Dockerfile](./Dockerfile)

The Docker image provides the VSCode hosting _and_ the CLI tools within the built-in terminal. The Docker image is derrived from [coder.com](https://coder.com).

* The [./cloudinit.txt](./cloudinit.txt) which configures the VM

For instance, if you wanted to run a workshop on *How to design helm charts* - you may comment out the references to OpenFaaS and install helm/tiller into the Docker image.


