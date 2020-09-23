#!/bin/bash
echo -n "admin" > user
echo -n ".123qwe" > pass
kubectl create secret generic rabbitmq-admin --from-file=./user --from-file=./pass
echo -n "YTqgE0lFaC0J0JKuUGk5" > cookie
kubectl create secret generic erlang-cookie --from-file=./cookie