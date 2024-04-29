#!/bin/bash

# Random file content and file names
echo "checking host connection"
# Test connection to Azurite's default port (10000) from within the container
nc -zv localhost 10000
nc -zv 127.0.0.1 10000
nc -zv host.docker.internal 10000

echo "Creating a random text file..."
echo "Sample content for a random file - $(date)" > /tmp/randomfile.txt
random_file_name="randomfile_$(date +%s).txt"

# 1. Upload a random file to Azure Blob Storage
echo "Uploading random file to Azure Blob Storage..."
az storage blob upload --container-name $AZURE_CONTAINER --name $random_file_name --file /tmp/randomfile.txt --connection-string $AZURE_CONNECTION_STRING

# 2. Download a specific file from Azure Blob Storage
echo "Downloading defined file from Azure Blob Storage..."
az storage blob download --container-name $AZURE_CONTAINER --name $random_file_name --file /tmp/$random_file_name --connection-string $AZURE_CONNECTION_STRING
echo "Content of the downloaded file:"
cat "/tmp/$random_file_name"

# 3. Run Osmosis command to display version
echo "Running Osmosis help..."
./bin/osmosis --help


