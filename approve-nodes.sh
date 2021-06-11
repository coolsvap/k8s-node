#!/bin/sh

NODES=`kubectl get csr | grep kubelet | grep Pending`
if [ ! -z "$NODES" ];
then 
  for i in `kubectl get csr | grep kubelet | grep Pending | awk '{print $1}'`; 
  do 
    kubectl certificate approve $i; 
  done
fi