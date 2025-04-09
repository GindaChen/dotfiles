#! /bin/bash

# List all models in the huggingface cache
function hfmodels() {
  for dir in $(ls ~/.cache/huggingface/hub | grep models); do 
    echo $dir | sed 's/models--//g' | sed 's/--/\//g'
  done
}