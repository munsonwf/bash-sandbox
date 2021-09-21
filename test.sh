#!/bin/bash

echo "STARTING BASH SCRIPT..."

if [ -n "$H_ENV" ]; then
  echo "Exists, set to: $H_ENV"
else
  echo "Not exists"
fi

if [ -n $(docker ps) ]; then
  echo "Exists, set to: $H_ENV"
else
  echo "Not exists"
fi

if [ -n $(asdfsdaf) ]; then
  echo "Exists, set to: $H_ENV"
else
  echo "Not exists"
fi