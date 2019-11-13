--Secrets--`


$ echo -n scott | base64
c2NvdHQ=
$ echo -n tiger | base64
dGlnZXI=

$ echo -n my_secret_password | base64
bXlfc2VjcmV0X3Bhc3N3b3Jk

$ echo bXlfc2VjcmV0X3Bhc3N3b3Jk | base64 -d
my_secret_password

kubectl apply -f 02-db-secret.yaml
kubectl describe secret db-secret -n development
kubectl delete  secret db-secret -n development

kubectl apply -f 03-mount-secrets.yaml
kubectl exec -it busybox -n development -- sh -c 'cat /root/key.txt'
mysecretlicensekey

kubectl apply -f 04-mount-env-secrets.yaml
kubectl exec -it busybox -n development -- sh -c 'env|grep DB_'
DB_PASSWORD=tiger
DB_USER=scott


