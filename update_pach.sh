#!/bin/bash

sed -i "s/1.0.x/$1.$2.$3/g" ./myapp/pom.xml

cat myapp/pom.xml
