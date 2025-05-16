# Use a Java 8 base image for Minecraft 1.16.5 and Forge 36.2.39
FROM openjdk:8-jre

# Set working directory
WORKDIR /data

# Copy all server files into the container
COPY . .

# Ensure launchserver.sh is executable
RUN chmod +x launchserver.sh

# Set file permissions to allow the server to write to /data
RUN chown -R 1000:1000 /data && \
    chmod -R 755 /data

# Switch to a non-root user for security (uid 1000)
USER 1000:1000

# Expose the Minecraft server port
EXPOSE 25565

# Run launchserver.sh to start the server
CMD ["./launchserver.sh"]