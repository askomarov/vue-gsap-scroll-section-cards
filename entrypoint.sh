#!/bin/sh

echo "Running yarn install..."
yarn install --frozen-lockfile

echo "Running yarn build..."
yarn build

echo "Cleaning up node_modules..."
rm -rf node_modules

echo "Starting Nginx..."
exec nginx -g "daemon off;"
