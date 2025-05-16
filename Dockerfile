# Use the official itzg/minecraft-server image as the base
FROM itzg/minecraft-server

# Set environment variables for the RAD2 modpack
ENV TYPE=CURSEFORGE
ENV CF_SLUG="roguelike-adventures-and-dungeons-2"
ENV EULA=TRUE
ENV MEMORY="8G"
ENV DIFFICULTY=hard
ENV MODE=survival
ENV PVP=false
ENV ENABLE_COMMAND_BLOCK=true
ENV SPAWN_PROTECTION=0
ENV GENERATE_STRUCTURES=true
ENV LEVEL_TYPE=DEFAULT

# Expose the default Minecraft server port
EXPOSE 25565

# Volume for persistent data (world, mods, configs)
# VOLUME /datas

# Start the server
CMD ["start"]