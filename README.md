# Build and push

```
docker build . -t registry.cube.local:5000/jupyter-nb:1.0.0 -t registry.cube.local:5000/jupyter-nb:latest
docker push registry.cube.local:5000/jupyter-nb:latest

kubectl create namespace jupyter-nb
kubectl apply -f k38/pvc.yml
kubectl apply -f k38/service.yml
kubectl apply -f k38/deployment.yml

```