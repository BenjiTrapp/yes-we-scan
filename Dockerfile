FROM alpine:latest

LABEL "com.github.actions.name"="nmap-scanner"
LABEL "com.github.actions.description"="Yes we scan - GitHub Action powerd nmap scanner"
LABEL "com.github.actions.icon"="cloud-lightning"
LABEL "com.github.actions.color"="Red"
LABEL "maintainer"="BenjiTrapp <nyctophobia@protonmail.com>"

RUN apk add bash curl git wget nmap nmap-scripts --no-cache && \
    rm -f /var/cache/apk/* && \
    mkdir -p  /usr/share/nmap/scripts/ && \
    cd /usr/share/nmap/scripts/ && \
    git clone https://github.com/scipag/vulscan scipag_vulscan && \
    ln -s `pwd`/scipag_vulscan /usr/share/nmap/scripts/vulscan && \
    cd vulscan/utilities/updater/ && \
    chmod +x updateFiles.sh && \
    bash updateFiles.sh

# WORKDIR /usr/share/nmap/scripts/

ADD containerfiles/entrypoint.sh .
ADD containerfiles/scan.txt .

RUN chmod ugo+x entrypoint.sh

ENTRYPOINT ["bash entrypoint.sh"]