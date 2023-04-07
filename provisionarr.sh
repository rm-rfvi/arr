#!/bin/bash

# Define server names
jackett_server="jackett.axfr.cc"
flaresolverr_server="flaresolverr.axfr.cc"
sonarr_server="sonarr.axfr.cc"
radarr_server="radarr.axfr.cc"
prowlarr_server="prowlarr.axfr.cc"
lidarr_server="lidarr.axfr.cc"
ombi_server="ombi.axfr.cc"
requestrr_server="requestrr.axfr.cc"
portainarr_server="portainarr.axfr.cc"
bazarr_server="bazarr.axfr.cc"
overseerr_server="overseerr.axfr.cc"
notifiarr_server="notifiarr.axfr.cc"
nzbhydra_server="nzbhydra.axfr.cc"
readarr_server="readarr.axfr.cc"
calibre_server="calibresvc.axfr.cc"
calibre_web_server="calibre.axfr.cc"
sabnzbd_server="sabnzbd.axfr.cc"
whisparr_server="whisparr.axfr.cc"
autobrr_server="autobrr.axfr.cc"
qbittorrent_server="qbit.axfr.cc"

# Define the lines to add to /etc/fstab
line1="10.0.0.10:/mnt/Pool0/scratch     /mnt/download   nfs    defaults,user,rw           0       0"
line2="10.0.0.10:/mnt/Pool0/media0        /mnt/media      nfs    defaults,user,rw        0       0"

# Create directories
sudo mkdir -p /opt/docker
sudo mkdir -p /opt/docker/build
sudo mkdir -p /opt/docker/run
sudo mkdir -p /opt/docker/tmp
sudo mkdir -p /opt/docker/run/notifiarr
sudo mkdir -p /opt/docker/tmp/notifiarr
sudo mkdir -p /opt/docker/run/overseerr
sudo mkdir -p /opt/docker/run/nzbhydra2
sudo mkdir -p /opt/docker/run/whisparr

sudo mkdir -p /opt/docker/run/readarr
sudo mkdir -p /opt/docker/run/calibre_svc
sudo mkdir -p /opt/docker/run/calibre
sudo mkdir -p /opt/docker/run/flaresolverr
sudo mkdir -p /opt/docker/run/sonarr
sudo mkdir -p /opt/docker/run/jackett
sudo mkdir -p /opt/docker/run/radarr
sudo mkdir -p /opt/docker/run/lidarr
sudo mkdir -p /opt/docker/run/requestrr
sudo mkdir -p /opt/docker/run/qbittorrent
sudo mkdir -p /opt/docker/run/ombi
sudo mkdir -p /opt/docker/run/prowlarr
sudo mkdir -p /opt/docker/run/whisparr
sudo mkdir -p /opt/docker/run/portainer
sudo mkdir -p /opt/docker/run/autobrr_postgres
sudo mkdir -p /opt/docker/run/autobrr

sudo mkdir -p /opt/docker/run/bazarr
sudo mkdir -p /opt/docker/run/sabnzbd

sudo mkdir -p /opt/docker/run/rutorrent

sudo mkdir -p /opt/docker/run/nginx
sudo mkdir -p /mnt/download
sudo mkdir -p /mnt/media
sudo mkdir -p /mnt/scratch

# Check if the lines are already present in /etc/fstab
if grep -Fxq "$line1" /etc/fstab && grep -Fxq "$line2" /etc/fstab; then
    echo "Lines already exist in /etc/fstab"
else
    # Add the lines to /etc/fstab
    echo -e "\n$line1\n$line2" | sudo tee -a /etc/fstab > /dev/null
    echo "Lines added to /etc/fstab"
fi

