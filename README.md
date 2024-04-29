# Osmosis Docker Image

This repository contains a Dockerfile to build a Docker image for running Osmosis, a data processing tool for OpenStreetMap data, in a Docker container. The image also includes setup for interacting with Azure Blob Storage using Azurite for local development.

## Usage

To build the Docker image, run the following command:

```bash
docker build -t osmosis-image .
```

To run the Docker container and interact with Osmosis and Azure Blob Storage, use the following command:
```bash
docker run -it --rm --network=host osmosis-image
```

## Challenge

The challenge involves setting up a Docker environment to run Osmosis for processing OpenStreetMap data and interact with Azure Blob Storage for storage and retrieval of data. Azurite is used as a local emulation tool for Azure Blob Storage, allowing for local development and testing without requiring access to a live Azure environment.

This README.md provides basic instructions on building the Docker image and running the Docker container. It also briefly describes the challenge of setting up Osmosis and Azure Blob Storage interaction for local development.

## Use Case

Included in this repository is a shell script `osmosis_task.sh` that demonstrates a common use case for using Osmosis and Azure Blob Storage. The shell script performs the following tasks:

1. Writes a random text file.
2. Uploads the random file to Azure Blob Storage.
3. Downloads the uploaded random file from Azure Blob Storage and logs its content.
4. Runs Osmosis to display its version information.

This use case simulates a scenario where Osmosis is used to process geographic data, and the processed data is stored and retrieved from Azure Blob Storage. The provided shell script can be customized and extended to fit specific data processing and storage requirements.

Feel free to explore and modify the shell script according to your use case!
