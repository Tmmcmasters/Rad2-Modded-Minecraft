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

# Create an entrypoint script to initialize the volume and run the installer
RUN echo '#!/bin/sh' > /entrypoint.sh && \
    echo '# Copy critical static files if missing' >> /entrypoint.sh && \
    echo 'if [ ! -f "/data/LaunchServer.sh" ]; then cp /tmp/data/LaunchServer.sh /data/; fi' >> /entrypoint.sh && \
    echo 'if [ ! -f "/data/forge-1.16.5-36.2.39.jar" ]; then cp /tmp/data/forge-1.16.5-36.2.39.jar /data/; fi' >> /entrypoint.sh && \
    echo 'if [ ! -f "/data/server.properties" ]; then cp /tmp/data/server.properties /data/; fi' >> /entrypoint.sh && \
    echo 'if [ ! -f "/data/eula.txt" ]; then cp /tmp/data/eula.txt /data/; fi' >> /entrypoint.sh && \
    echo 'if [ ! -d "/data/mods" ]; then cp -r /tmp/data/mods /data/; fi' >> /entrypoint.sh && \
    echo 'if [ ! -d "/data/config" ]; then cp -r /tmp/data/config /data/; fi' >> /entrypoint.sh && \
    echo '# Run the Forge installer to download required libraries' >> /entrypoint.sh && \
    echo 'echo "Running Forge installer..."' >> /entrypoint.sh && \
    echo 'java -jar /data/forge-1.16.5-36.2.39.jar --installServer || { echo "Forge installer failed"; exit 1; }' >> /entrypoint.sh && \
    echo '# Debug: List files in /data' >> /entrypoint.sh && \
    echo 'ls -la /data' >> /entrypoint.sh && \
    echo '# Debug: List contents of world directory if it exists' >> /entrypoint.sh && \
    echo 'if [ -d "/data/world" ]; then ls -la /data/world; else echo "World directory does not exist"; fi' >> /entrypoint.sh && \
    echo '# Debug: List contents of libraries directory if it exists' >> /entrypoint.sh && \
    echo 'if [ -d "/data/libraries" ]; then ls -la /data/libraries; else echo "Libraries directory does not exist"; fi' >> /entrypoint.sh && \
    echo 'exec /data/LaunchServer.sh' >> /entrypoint.sh && \
    chmod +x /entrypoint.sh

# Expose the Minecraft server port
EXPOSE 25565

# Use the entrypoint script to start the server
ENTRYPOINT ["/entrypoint.sh"]