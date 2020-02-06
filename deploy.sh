#build images (tag with latest and tag with git commit sha)
docker build -t jellydock/multi-client:latest -t jellydock/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t jellydock/mutli-server:latest -t jellydock/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t jellydock/multi-worker:latest -t jellydock/multi-worker:$SHA -f ./worker/Dockerfile ./worker

#push images
docker push jellydock/multi-client:latest
docker push jellydock/multi-server:latest
docker push jellydock/multi-worker:latest

docker push jellydock/multi-client:$SHA
docker push jellydock/multi-server:$SHA
docker push jellydock/multi-worker:$SHA

#apply kubernetes config files
kubectl apply -f k8s

#set latest image on each deployment
kubectl set image deployments/server-deployment server=jellydock/multi-server:$SHA
kubectl set image deployments/client-deployment client=jellydock/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=jellydock/multi-worker:$SHA

