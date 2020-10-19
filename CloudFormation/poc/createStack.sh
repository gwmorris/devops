#!/bin/bash

aws cloudformation create-stack --stack-name POC-Network --template-body file://core_network.yaml
aws cloudformation wait stack-create-complete --stack-name POC-Network

aws cloudformation create-stack --stack-name SG-FDAGOV-ProdExt-Cons-A-App --template-body file://SG-FDAGOV-ProdExt-Cons-A-App.yaml
aws cloudformation wait stack-create-complete --stack-name SG-FDAGOV-ProdExt-Cons-A-App

aws cloudformation create-stack --stack-name SG-FDAGOV-ProdExt-Cons-B-App --template-body file://SG-FDAGOV-ProdExt-Cons-B-App.yaml
aws cloudformation wait stack-create-complete --stack-name SG-FDAGOV-ProdExt-Cons-B-App

aws cloudformation create-stack --stack-name SG-FDAGOV-ProdExt-Automation-App --template-body file://SG-FDAGOV-ProdExt-Automation-App.yaml
aws cloudformation wait stack-create-complete --stack-name SG-FDAGOV-ProdExt-Automation-App


