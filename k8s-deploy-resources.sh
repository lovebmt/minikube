#!/bin/bash
#
# Copyright © 2016-2020 The Thingsboard Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

source .env
kubectl apply -f tb-namespace.yml || echo

kubectl config set-context $(kubectl config current-context) --namespace=thingboard-dev

kubectl apply -f $DATABASE/tb-node-db-configmap.yml
kubectl apply -f tb-cache-configmap.yml
kubectl apply -f tb-kafka-configmap.yml
kubectl apply -f tb-node-configmap.yml
kubectl apply -f tb-transport-configmap.yml
kubectl apply -f thingsboard.yml
kubectl apply -f tb-node.yml

kubectl apply -f routes.yml

