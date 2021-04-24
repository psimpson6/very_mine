
# JRE base
FROM adoptopenjdk/openjdk11:debian

# Environment variables
ENV MC_VERSION="latest" \
    PAPER_BUILD="latest" \
    MC_RAM="256M" \
    JAVA_OPTS=""

ADD papermc.sh .
RUN apt-get install -y apt-transport-https
RUN apt-get update \
    && apt-get install -y wget \
    && apt-get install -y jq \
    && mkdir /papermc

# Start script
CMD ["sh", "./papermc.sh"]

# Container setup
EXPOSE 25565/tcp
EXPOSE 25565/udp
VOLUME /papermc
