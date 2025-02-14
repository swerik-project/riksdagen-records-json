#!/bin/bash


for zipf in _zip/*.zip; do
    dir_=$(basename -- ${zipf%.*.*})
    echo $dir_
    if [ ! -d data/$dir_ ] ; then
        mkdir data/$dir_
    fi
    unzip -o $zipf -d data/$dir_
    git add data/$dir_
    git commit --allow-empty -m "feat: update json"
    git push origin main
done
