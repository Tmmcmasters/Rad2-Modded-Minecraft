# Use the itzg/minecraft-server image with Java 8
FROM itzg/minecraft-server

# Set environment variables for the Minecraft server
ENV TYPE=AUTO_CURSEFORGE
ENV CF_PAGE_URL=https://www.curseforge.com/minecraft/modpacks/roguelike-adventures-and-dungeons-2
ENV MEMORY=16G
ENV EULA=TRUE
ENV ENABLE_WHITELIST=FALSE
ENV ENFORCE_SECURE_PROFILE=FALSE
ENV PORT=25565
ENV JVM_OPTS="-XX:+PrintGCDetails -XX:+PrintGCDateStamps -Xloggc:/data/gc.log"

# Use an entrypoint script to ensure /data permissions are correct
# RUN echo '#!/bin/sh' > /entrypoint.sh && \
#     echo 'chown -R 1000:1000 /data' >> /entrypoint.sh && \
#     echo 'exec /start' >> /entrypoint.sh && \
#     chmod +x /entrypoint.sh

# ENTRYPOINT ["/entrypoint.sh"]

# Expose the Minecraft server port and VoiceChat port (optional)
EXPOSE 25565
EXPOSE 24454