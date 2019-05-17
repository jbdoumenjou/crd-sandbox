This is a simple example of traefik with kubernetes as CRD IngressRoute

# Create A local Image 

`docker save containous/traefik:latest -o ./images/traefik.tar`

# Launch The Stack:

`docker-compose up -d`

# Use The Right Kubernetes

`export KUBECONFIG=$(pwd)/out/kubeconfig.yaml`

# Check the Stack

`kubectl get all`

# Expose the Traefik Service

`kubectl port-forward service/traefik 8000:8000 8080:8080 8090:8090 -n default`

# Check the Configuration

`curl localhost:8080/api/rawdata`

# Try the HTTP Service

`curl localhost:8000/whoami`

# Try the TCP Service

```
telnet localhost 8090
WHO
STOP
```