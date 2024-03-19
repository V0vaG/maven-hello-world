#!/bin/bash

sed -i "s/x.y.z/$1.$2.$3/g" ./myapp/pom.xml

cat myapp/pom.xml
