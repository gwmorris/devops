#!/bin/bash

nohup java -jar /opt/api/target/api.jar --spring.config.name=dashboard --spring.config.location=/opt/api/dashboard.properties -Djasypt.encryptor.password=hygieiasecret &
