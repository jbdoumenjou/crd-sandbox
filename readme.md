# Purpose

Test traefik with kubernetes crd provider.  
Use k3s as a kubernetes stack to keep it simple to use.  
The k3s container will forward HTTP and TCP traffic to the traefik service.

# Usage

## Makefile
   
### `make all`
   
* Creates needed images
* Launch the k3s stack
* Set the KUBECONFIG environment variable.
   
### `make build-images`

* Clean the images directory
* Prepare whoami, whoamitcp and traefik images for the k3s stack.

### `make stop`

* Stop the stack
* Clean docker images/volumes

### `make test-http`

* Simple http call to the whoami via traefik

### `make test-api`

* Simple http call to the traefik api

### `make test-tcp`

* Simple tcp call to the whoamitcp via traefik

## Check the Stack

`kubectl get all`

# Try the TCP Service

```
telnet localhost 8090
WHO
STOP
```

Type WHO to get a whoamitcp response.
Type STOP to close the connection.