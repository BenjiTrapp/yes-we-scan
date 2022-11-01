FROM alpine:latest

LABEL "com.github.actions.name"="nmap-scanner"
LABEL "com.github.actions.description"="Yes we scan - GitHub Action powerd nmap scanner"
LABEL "com.github.actions.icon"="cloud-lightning"
LABEL "com.github.actions.color"="Red"
LABEL "maintainer"="BenjiTrapp <nyctophobia@protonmail.com>"

RUN apk add bash curl git wget nmap --no-cache && \
    rm -f /var/cache/apk/* && \
    mkdir -p  /usr/share/nmap/scripts/ && \
    cd /usr/share/nmap/scripts/ && \
    git clone https://github.com/vulnersCom/nmap-vulners.git && \
    git clone https://github.com/scipag/vulscan.git && \
    cd vulscan/utilities/updater/ && \
    chmod +x updateFiles.sh && \
    bash updateFiles.sh

ADD containerfiles/entrypoint.sh /entrypoint.sh
ADD containerfiles/scan.txt /scan.txt

ENTRYPOINT ["/entrypoint.sh"]