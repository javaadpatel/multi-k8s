#creating a secret:
kubectl create secret generic pgpassword --from-literal PGPASSWORD=<password>

#view secrets:
kubectl get secrets

#nginx mandatory command:
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.28.0/deploy/static/mandatory.yaml


#troubleshooting container pull errors:
-> login into minikube using `minikube ssh` -> login into docker

#start ruby container and mount volume (windows powershell):
docker run -it -v ${PWD}:/app ruby:2.3 sh

#install helm (V3) in google console 
>curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 > get_helm.sh
>chmod 700 get_helm.sh
>./get_helm.sh

>helm repo add stable https://kubernetes-charts.storage.googleapis.com/
>helm install my-nginx stable/nginx-ingress --set rbac.create=true 