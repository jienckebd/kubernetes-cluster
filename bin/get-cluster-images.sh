#!/usr/bin/env bash

kubectl get pods --all-namespaces -o jsonpath="{.items[*].spec.containers[*].image}" |\
tr -s '[[:space:]]' '\n' |\
xargs printf '\- %s\n' |\
sort |\
uniq
