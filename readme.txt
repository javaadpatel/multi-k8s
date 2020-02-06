#creating a secret:
kubectl create secret generic pgpassword --from-literal PGPASSWORD=password123

#view secrets:
kubectl get secrets

#nginx mandatory command:
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.28.0/deploy/static/mandatory.yaml


#troubleshooting container pull errors:
-> login into minikube using `minikube ssh` -> login into docker

#start ruby container and mount volume (windows powershell):
docker run -it -v ${PWD}:/app ruby:2.3 sh