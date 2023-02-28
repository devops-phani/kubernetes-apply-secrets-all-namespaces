#!/bin/bash

NAMESPACES=$(kubectl get namespace | awk '{print $1}' | tail -n +2)
SECRET_NAME=my-tls-secret

for ns in $NAMESPACES
do
  kubectl get secret  $SECRET_NAME -n $ns &> /dev/null
  exit_status=$?
  if [[ $exit_status -eq 0 ]]
  then
    #kubectl apply -f  ${SECRET_NAME}.yaml -n $ns
    echo $ns ssl updated
  fi
done
