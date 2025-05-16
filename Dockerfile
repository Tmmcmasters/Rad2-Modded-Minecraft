# Use a Java 8 base image for Minecraft 1.16.5 and Forge 36.2.39
FROM openjdk:8-jre

# Set working directory
WORKDIR /data

# Copy all server files into a temporary directory
COPY . /tmp/data

# Ensure LaunchServer.sh is executable in the temporary directory
RUN chmod +x /tmp/data/LaunchServer.sh

# Debug: List files in /tmp/data to confirm
RUN ls -la /tmp/data

# Create an entrypoint script to initialize the volume
RUN echo '#!/bin/sh' > /entrypoint.sh && \
    echo 'if [ -z "$(ls -A /data)" ] || [ "$(ls -A /data)" = "lost+found" ]; then cp -r /tmp/data/* /data; fi' >> /entrypoint.sh && \
    echo 'ls -la /data' >> /entrypoint.sh && \
    echo 'exec /data/LaunchServer.sh' >> /entrypoint.sh && \
    chmod +x /entrypoint.sh

# Expose the Minecraft server port
EXPOSE 25565

# Use the entrypoint script to start the server
ENTRYPOINT ["/entrypoint.sh"]