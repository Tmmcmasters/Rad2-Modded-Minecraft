# Use a Java 8 base image for Minecraft 1.16.5 and Forge 36.2.39
FROM openjdk:8-jre

# Set working directory
WORKDIR /data

# Copy server files to a temporary directory
COPY . /tmp/data

# Set permissions on /tmp/data during build
RUN chown -R 1000:1000 /tmp/data && \
    chmod -R 755 /tmp/data && \
    chmod +x /tmp/data/LaunchServer.sh

# Create an entrypoint script to copy files to /data if it's empty
RUN echo '#!/bin/sh' > /entrypoint.sh && \
    echo 'if [ -z "$(ls -A /data)" ] || [ "$(ls -A /data)" = "lost+found" ]; then cp -r /tmp/data/* /data; fi' >> /entrypoint.sh && \
    echo 'exec /data/LaunchServer.sh' >> /entrypoint.sh && \
    chmod +x /entrypoint.sh

# Switch to a non-root user for security (uid 1000)
USER 1000:1000

# Expose the Minecraft server port
EXPOSE 25565

# Use the entrypoint script to start the server
ENTRYPOINT ["/entrypoint.sh"]