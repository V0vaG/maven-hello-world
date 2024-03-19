#!/bin/bash

new_pach=$1

echo 'setting new pach to: $new_pach'
sed -i "s/1.0.x/1.0.$new_pach/g" ./myapp/test.txt

cat myapp/test.txt
