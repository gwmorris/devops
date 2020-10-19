#!/bin/bash

STACK_NAME=POC-Network
FILENAME=core_network.yaml

aws cloudformation delete-stack --stack-name SG-FDAGOV-ProdExt-Automation-App
#aws cloudformation wait stack-create-complete --stack-name SG-FDAGOV-ProdExt-Automation-App

aws cloudformation delete-stack --stack-name SG-FDAGOV-ProdExt-Cons-B-App 
#aws cloudformation wait stack-delete-complete --stack-name SG-FDAGOV-ProdExt-Cons-B-App

aws cloudformation delete-stack --stack-name SG-FDAGOV-ProdExt-Cons-A-App
#aws cloudformation wait stack-delete-complete --stack-name SG-FDAGOV-ProdExt-Cons-A-App

aws cloudformation delete-stack --stack-name POC-Network 
#aws cloudformation wait stack-delete-complete --stack-name POC-Network
