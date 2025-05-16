# Use the itzg/minecraft-server image as the base
FROM itzg/minecraft-server

# Set environment variables for the Minecraft server
ENV TYPE=FORGE
ENV VERSION=1.16.5
ENV FORGE_VERSION=36.2.39
ENV MEMORY=16G
ENV EULA=TRUE
ENV ENABLE_WHITELIST=TRUE
ENV ENFORCE_SECURE_PROFILE=FALSE

# Copy custom files to a temporary directory
COPY . /tmp/data

# Use an entrypoint script to copy files into /data if it's empty
RUN echo '#!/bin/sh' > /entrypoint.sh && \
    echo 'if [ -z "$(ls -A /data)" ]; then cp -r /tmp/data/* /data; fi' >> /entrypoint.sh && \
    echo 'chown -R 1000:1000 /data' >> /entrypoint.sh && \
    echo 'exec /start' >> /entrypoint.sh && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

# Expose the Minecraft server port and VoiceChat port
EXPOSE 25565
EXPOSE 24454