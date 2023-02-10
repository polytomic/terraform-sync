#!/bin/bash
set -ex
# This script is used to track changes from polytomic in HCL
# It uses the polytomic importer to generate HCL from the app.
API_KEY=$1
DIR=$2
URL=$3

# Run the polytomic importer
echo "Running polytomic importer"

# Generate HCL from the app
./polytomic-importer run \
    --api-key ${API_KEY} \
    --url ${URL} \
    --output ${DIR} \
    --replace
