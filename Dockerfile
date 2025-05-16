FROM itzg/minecraft-server:latest

# Accept the Minecraft EULA
ENV EULA=TRUE

# Set the server type to use auto CurseForge
ENV TYPE=AUTO_CURSEFORGE

# Specify the Roguelike Adventures and Dungeons 2 modpack URL
ENV CF_PAGE_URL=https://www.curseforge.com/minecraft/modpacks/roguelike-adventures-and-dungeons-2

# Allocate memory for the server (adjust as needed)
ENV MEMORY=16G

# Expose the default Minecraft port
EXPOSE 25565