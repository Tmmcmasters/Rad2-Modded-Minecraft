# Use a Java 8 base image for Minecraft 1.16.5 and Forge 36.2.39
FROM openjdk:8-jre

# Set working directory
WORKDIR /data

# Copy all server files into the container
COPY . .

# Ensure LaunchServer.sh is executable
RUN chmod +x LaunchServer.sh

# Expose the Minecraft server port
EXPOSE 25565

# Run LaunchServer.sh to start the server
CMD ["./LaunchServer.sh"]