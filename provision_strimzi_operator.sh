#!/bin/sh

START=1
END=2

echo "Creating projects."

for i in $(seq $START $END); do
   echo "Setting up environment for user$i."
   PROJECT_NAME="kogito-operator-lab-user$i"

   # Create Operator subscription.
   cat csc.cr.yaml | sed -e "s/namespace-placeholder/$PROJECT_NAME/g" | oc apply -f -

   cat strimzi-operator-sub.yaml | sed -e "s/namespace-placeholder/$PROJECT_NAME/g" | oc apply -f -
done
