#!/bin/bash

app=""

echo "Enter the name of the app you want to create"
read app

cd /home/workdir
npm create svelte@latest ${app}
cd ${app}
npm install

echo "App created successfully"

exit 0