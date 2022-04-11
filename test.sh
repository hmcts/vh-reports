#!/bin/bash

#set up datasets
for file in ./dataset/*
do
  echo "$file"
  fileName=$(cut -f 1 -d '.' "$file")
  
  echo "$fileName"
  az datafactory dataset create --resource-group vh-reporting-infra-dev --factory-name "vh-datafactory-dev" --name "$fileName" --properties "$file" --debug
done

# # set up pipelines
#for file in ./pipeline/*
#do
#  fileName=`cut -f 1 -d '.' $file`
#  az datafactory pipeline create --resource-group vh-reporting-infra-dev --factory-name "vh-datafactory-dev" --name $fileName --pipeline $file
#done