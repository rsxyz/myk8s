kubectl create generic secret mysecrets \
    --from-env-file=./creds.txt   \
    --from-file=licensekey=./key.txt \
    --from-literal=webhook-token=sdfk232
    --from-literal=sonark-token=iow2230x

kubectl describe secret mysecret 
