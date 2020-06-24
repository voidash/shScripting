#!/bin/bash

for i in $(ls -l .?* | grep -oP "\s\..*")
do
        mv $i ${i:1}
done
          
