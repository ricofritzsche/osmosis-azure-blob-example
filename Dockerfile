# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Install Osmosis and required packages
RUN apt-get update && apt-get install -y wget gnupg ca-certificates apt-transport-https lsb-release \
    && apt-get install -y netcat \
    && wget https://aka.ms/InstallAzureCLIDeb --output-document - | bash \
    && wget -O osmosis-latest.tgz https://github.com/openstreetmap/osmosis/releases/download/0.48.3/osmosis-0.48.3.tgz \
    && tar xvfz osmosis-latest.tgz && rm osmosis-latest.tgz \
    && chmod +x /usr/src/app/bin/osmosis \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy the script into the container
COPY osmosis_task.sh /usr/src/app/
RUN chmod +x /usr/src/app/osmosis_task.sh

# Environment variables for Azure Blob Storage 
ENV AZURE_CONTAINER=mycontainer
ENV AZURE_CONNECTION_STRING="DefaultEndpointsProtocol=http;AccountName=devstoreaccount1;AccountKey=Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==;BlobEndpoint=http://host.docker.internal:10000/devstoreaccount1;QueueEndpoint=http://host.docker.internal:10001/devstoreaccount1;"

# Run the script when the container launches
CMD ["./osmosis_task.sh"]

