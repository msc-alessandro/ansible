#!/bin/bash
kubectl delete statefulset --all
sleep 5
kubectl delete pvc --all
kubectl delete pv --all