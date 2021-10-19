#!/usr/bin/env bash

export SYS_HELM_NAMESPACE_SUFFIX=ide1
cd /Users/bry/sys/kubernetes/sc
helmfile --environment=ide apply
