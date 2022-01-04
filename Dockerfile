FROM mcr.microsoft.com/dotnet/runtime:6.0-bullseye-slim-arm64v8 AS base

# Installing general utils
RUN apt-get update
RUN apt-get install -y nano
RUN apt-get install -y inetutils-ping 
RUN apt-get install -y fonts-symbola
RUN apt-get install -y fonts-dejavu

# Installing Tinkerforge related stuff
RUN apt-get install -y wget gnupg lsb-base lsb-release
RUN wget https://download.tinkerforge.com/apt/debian/archive.key -q -O - | apt-key add -
RUN sh -c "echo 'deb https://download.tinkerforge.com/apt/debian $(lsb_release -cs) main' > /etc/apt/sources.list.d/tinkerforge.list"
RUN apt-get update
RUN apt-get install -y brickd

# Cleaning up
RUN rm -rf /var/lib/apt/lists/*

EXPOSE 4223

# Let's go boys!
ENTRYPOINT ["brickd"]