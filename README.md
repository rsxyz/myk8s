# myk8s



Retrieve an authentication token and authenticate your Docker client to your registry.
Use the AWS CLI:

aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 608914848486.dkr.ecr.us-west-2.amazonaws.com
docker build -t flask-app .
docker tag flask-app:latest 608914848486.dkr.ecr.us-west-2.amazonaws.com/flask-app:latest
docker push 608914848486.dkr.ecr.us-west-2.amazonaws.com/flask-app:latest