# Use the official itzg/minecraft-server image as the base
FROM itzg/minecraft-server

# Set environment variables for the RAD2 modpack
ENV TYPE=CURSEFORGE
ENV VERSION=1.16.5
ENV CF_SLUG="roguelike-adventures-and-dungeons-2"
ENV CF_SERVER_MOD=TRUE
ENV EULA=TRUE
ENV MEMORY="8G"
ENV DIFFICULTY=hard
ENV MODE=survival
ENV PVP=false
ENV ENABLE_COMMAND_BLOCK=true
ENV SPAWN_PROTECTION=0
ENV GENERATE_STRUCTURES=true
ENV LEVEL_TYPE=DEFAULT
ENV FORGEVERSION="36.2.39"
ENV JAVA_ARGS="-XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC"

# Expose the default Minecraft server port
EXPOSE 25565

# Volume for persistent data (world, mods, configs)
# VOLUME /data

# Start the server
CMD ["start"]