#!/bin/bash

echo "setting new pach to: ${{ github.run_number }}"

sed -i "s/1.0.x/1.0.$1/g" ./myapp/pom.xml

cat myapp/pom.xml
