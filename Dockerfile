FROM itzg/minecraft-server

# Copy all server files into the container's data directory
COPY . /data

# Environment variables for the server
ENV TYPE=FORGE
ENV FORGE_INSTALLER=/data/forge-1.16.5-36.2.39.jar
ENV EULA=TRUE
# ENV ENABLE_WHITELIST=TRUE
ENV MEMORY=16G


ENTRYPOINT ["/LaunchServer.sh"]

EXPOSE 25565

# Ensure the data directory is used for persistence
# VOLUME /data