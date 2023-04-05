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
calibre_server"calibresvc.axfr.cc"
calibre_web_server="calibre.axfr.cc"

# Define the lines to add to /etc/fstab
line1="stor01.axfr.cc:/mnt/Pool0/scratch     /mnt/download   nfs    defaults,user,rw           0       0"
line2="stor01.axfr.cc:/mnt/Pool0/media0        /mnt/media      nfs    defaults,user,rw        0       0"

 

# Create directories
sudo mkdir -p /opt/docker
sudo mkdir -p /opt/docker/build
sudo mkdir -p /opt/docker/run
sudo mkdir -p /opt/docker/tmp
sudo mkdir -p /opt/docker/run/notifiarr
sudo mkdir -p /opt/docker/tmp/notifiarr
sudo mkdir -p /opt/docker/run/overseerr
sudo mkdir -p /opt/docker/run/nzbhydra2
sudo mkdir -p /opt/docker/run/readarr
sudo mkdir -p /opt/docker/run/calibre
sudo mkdir -p /opt/docker/run/calibre_web

sudo mkdir -p /opt/docker/run/flaresolverr
sudo mkdir -p /opt/docker/run/sonarr
sudo mkdir -p /opt/docker/run/jackett
sudo mkdir -p /opt/docker/run/radarr
sudo mkdir -p /opt/docker/run/lidarr
sudo mkdir -p /opt/docker/run/requestrr
sudo mkdir -p /opt/docker/run/qbittorrent
sudo mkdir -p /opt/docker/run/ombi
sudo mkdir -p /opt/docker/run/prowlarr
sudo mkdir -p /opt/docker/run/portainer
sudo mkdir -p /opt/docker/run/bazarr



sudo mkdir -p /opt/sabnzbd
sudo mkdir -p /opt/rutorrent

sudo mkdir -p /opt/nginx
sudo mkdir -p /mnt/download
sudo mkdir -p /mnt/media





# Check if the lines are already present in /etc/fstab
if grep -Fxq "$line1" /etc/fstab && grep -Fxq "$line2" /etc/fstab; then
    echo "Lines already exist in /etc/fstab"
else
    # Add the lines to /etc/fstab
    echo -e "\n$line1\n$line2" | sudo tee -a /etc/fstab > /dev/null
    echo "Lines added to /etc/fstab"
fi



# Create nginx jackett config file
sudo tee /opt/nginx/jackett.conf > /dev/null <<EOF

  upstream jackett {
    server 192.168.2.2:9117;
  }

server {
  listen        80;
  server_name   $jackett_server;

  location / {
    proxy_pass  http://192.168.2.2:9117;
  }
}

EOF

# Create nginx flaresolverr config file
sudo tee /opt/nginx/flaresolverr.conf > /dev/null <<EOF

  upstream flaresolverr {
    server 192.168.3.2:8191;
  }

server {
  listen        80;
  server_name   $flaresolverr_server;

  location / {
    proxy_pass  http://192.168.1.2:8191;
  }
}

EOF

# Create nginx sonarr config file
sudo tee /opt/nginx/sonarr.conf > /dev/null <<EOF

  upstream sonarr {
    server 192.168.3.2:8989;
  }

server {
  listen        80;
  server_name   $sonarr_server;

  location / {
    proxy_pass  http://192.168.3.2:8989;
  }
}

EOF


# Create nginx radarr config file
sudo tee /opt/nginx/radarr.conf > /dev/null <<EOF

  upstream radarr {
    server 192.168.4.2:7878;
  }

server {
  listen        80;
  server_name   $radarr_server;

  location / {
    proxy_pass  http://192.168.4.2:7878;
  }
}

EOF

# Create nginx prowlarr2 config file
sudo tee /opt/nginx/prowlarr.conf > /dev/null <<EOF

  upstream prowlarr {
    server 192.168.10.2:9696;
  }

server {
  listen        80;
  server_name   $prowlarr_server;

  location / {
    proxy_pass  http://192.168.10.2:9696;
  }
}

EOF

# Create nginx lidarr config file
sudo tee /opt/nginx/lidarr.conf > /dev/null <<EOF

  upstream lidarr {
    server 192.168.5.2:8686;
  }

server {
  listen        80;
  server_name   $lidarr_server;

  location / {
    proxy_pass  http://192.168.5.2:8686;
  }
}

EOF


# Create nginx ombi config file
sudo tee /opt/nginx/ombi.conf > /dev/null <<EOF

  upstream ombi {
    server 192.168.8.2:3579;
  }

server {
  listen        80;
  server_name   $ombi_server;

  location / {
    proxy_pass  http://192.168.8.2:3579;
  }
}

EOF

# Create nginx portainarr config file
sudo tee /opt/nginx/portainarr.conf > /dev/null <<EOF

  upstream portainarr {
    server 192.168.13.2:9000;
  }

server {
  listen        80;
  server_name   $portainarr_server;

  location / {
    proxy_pass  http://192.168.13.2:9000;
  }
}

EOF


# Create nginx requestrr config file
sudo tee /opt/nginx/requestrr.conf > /dev/null <<EOF

  upstream requestrr {
    server 192.168.6.2:4545;
  }

server {
  listen        80;
  server_name   $requestrr_server;

  location / {
    proxy_pass  http://192.168.6.2:4545;
  }
}

EOF

# Create nginx bazarr config file
sudo tee /opt/nginx/bazarr.conf > /dev/null <<EOF

  upstream bazarr {
    server 192.168.14.2:6767;
  }

server {
  listen        80;
  server_name   $bazarr_server;

  location / {
    proxy_pass  http://192.168.14.2:6767;
  }
}

EOF

# Create nginx overseerr config file
sudo tee /opt/nginx/overseer.conf > /dev/null <<EOF

  upstream overseerr {
    server 192.168.15.2:5055;
  }

server {
  listen        80;
  server_name   $overseerr_server;

  location / {
    proxy_pass  http://192.168.15.2:5055;
  }
}

EOF



# Create nginx notifiarr config file
sudo tee /opt/nginx/notifiarr.conf > /dev/null <<EOF

  upstream notifiarr {
    server 192.168.16.2:5454;
  }

server {
  listen        80;
  server_name   $notifiarr_server;

  location / {
    proxy_pass  http://192.168.16.2:5454;
  }
}

EOF



# Create nginx nzbhydra config file
sudo tee /opt/nginx/nzbhydra.conf > /dev/null <<EOF

  upstream nzbhydra {
    server 192.168.17.2:5076;
  }

server {
  listen        80;
  server_name   $nzbhydra_server;

  location / {
    proxy_pass  http://192.168.17.2:5076;
  }
}

EOF



# Create nginx readarr config file
sudo tee /opt/nginx/readarr.conf > /dev/null <<EOF

  upstream readarr {
    server 192.168.18.2:8787;
  }

server {
  listen        80;
  server_name   $readarr_server;

  location / {
    proxy_pass  http://192.168.18.2:8787;
  }
}

EOF
