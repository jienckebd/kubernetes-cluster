#!/usr/bin/env bash

set -e

kubectl patch crd challenges.acme.cert-manager.io -p '{"metadata":{"finalizers": []}}' --type=merge
