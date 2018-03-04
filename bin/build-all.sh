#!/bin/sh

cd ../catalog
npm i && npm run build

cd ../inventory
npm i && npm run build

cd ../api-gateway
npm i && npm run build
