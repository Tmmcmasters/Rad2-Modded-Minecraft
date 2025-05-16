# Use the itzg/minecraft-server image as the base
FROM itzg/minecraft-server:java8

# Set the working directory to /data (where the server files are stored in the container)
WORKDIR /data

# Copy all the server files from your local directory to the container's /data directory
COPY config /data/config
COPY kubejs /data/kubejs
COPY libraries /data/libraries
COPY mods /data/mods
COPY scripts /data/scripts
COPY 1.16.5.json /data/1.16.5.json
COPY eula.txt /data/eula.txt
COPY forge-1.16.5-36.2.39.jar /data/forge-1.16.5-36.2.39.jar
COPY minecraft_server.1.16.5.jar /data/minecraft_server.1.16.5.jar
COPY ops.json /data/ops.json
COPY railway.json /data/railway.json
COPY server.properties /data/server.properties
COPY whitelist.json /data/whitelist.json

# Set environment variables for the itzg/minecraft-server image
ENV EULA=TRUE
ENV TYPE=FORGE
ENV FORGEVERSION=36.2.39
ENV MEMORY=4G

# Expose the Minecraft server port
EXPOSE 25565

# The CMD is inherited from the base image, which starts the Minecraft server