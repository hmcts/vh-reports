#!/bin/bash

for file in ./dataset/*
do
  fileName="$(basename $file .json)"
  echo $fileName
  az datafactory dataset create --resource-group vh-reporting-infra-dev --factory-name "vh-datafactory-dev" --name $fileName --properties $file --debug
done
          