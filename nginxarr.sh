# Create nginx jackett config file
sudo tee /opt/docker/run/nginx/jackett.conf > /dev/null <<EOF

server {
  listen        80;
  server_name   $jackett_server;

  location / {
    proxy_pass  http://jackett:9117;
  }
}

EOF

# Create nginx flaresolverr config file
sudo tee /opt/docker/run/nginx/flaresolverr.conf > /dev/null <<EOF

server {
  listen        80;
  server_name   $flaresolverr_server;

  location / {
    proxy_pass  http://flaresolverr:8191;
  }
}

EOF

# Create nginx sonarr config file
sudo tee /opt/docker/run/nginx/sonarr.conf > /dev/null <<EOF

server {
  listen        80;
  server_name   $sonarr_server;

  location / {
    proxy_pass  http://sonarr:8989;
  }
}

EOF

# Create nginx radarr config file
sudo tee /opt/docker/run/nginx/radarr.conf > /dev/null <<EOF


server {
  listen        80;
  server_name   $radarr_server;

  location / {
    proxy_pass  http://radarr:7878;
  }
}

EOF

# Create nginx prowlarr2 config file
sudo tee /opt/docker/run/nginx/prowlarr.conf > /dev/null <<EOF


server {
  listen        80;
  server_name   $prowlarr_server;

  location / {
    proxy_pass  http://prowlarr:9696;
  }
}

EOF

# Create nginx lidarr config file
sudo tee /opt/docker/run/nginx/lidarr.conf > /dev/null <<EOF


server {
  listen        80;
  server_name   $lidarr_server;

  location / {
    proxy_pass  http://lidarr:8686;
  }
}

EOF

# Create nginx ombi config file
sudo tee /opt/docker/run/nginx/ombi.conf > /dev/null <<EOF

server {
  listen        80;
  server_name   $ombi_server;

  location / {
    proxy_pass  http://ombi:3579;
  }
}

EOF
# Create nginx portainarr config file
#sudo tee /opt/docker/run/nginx/portainarr.conf > /dev/null <<EOF
#
#server {
#  listen        80;
#  server_name   $portainarr_server;
#
#  location / {
#    proxy_pass  http://portainarr:9000;
#  }
#}

EOF


# Create nginx requestrr config file
sudo tee /opt/docker/run/nginx/requestrr.conf > /dev/null <<EOF

server {
  listen        80;
  server_name   $requestrr_server;

  location / {
    proxy_pass  http://requestrr:4545;
  }
}

EOF
# Create nginx bazarr config file
sudo tee /opt/docker/run/nginx/bazarr.conf > /dev/null <<EOF


server {
  listen        80;
  server_name   $bazarr_server;

  location / {
    proxy_pass  http://bazarr:6767;
  }
}

EOF
# Create nginx overseerr config file
sudo tee /opt/docker/run/nginx/overseer.conf > /dev/null <<EOF

server {
  listen        80;
  server_name   $overseerr_server;

  location / {
    proxy_pass  http://overseerr:5055;
  }
}

EOF



# Create nginx notifiarr config file
sudo tee /opt/docker/run/nginx/notifiarr.conf > /dev/null <<EOF

server {
  listen        80;
  server_name   $notifiarr_server;

  location / {
    proxy_pass  http://notifiarr:5454;
  }
}

EOF
# Create nginx nzbhydra config file
sudo tee /opt/docker/run/nginx/nzbhydra.conf > /dev/null <<EOF

server {
  listen        80;
  server_name   $nzbhydra_server;

  location / {
    proxy_pass  http://nzbhydra2:5076;
  }
}

EOF


# Create nginx readarr config file
sudo tee /opt/docker/run/nginx/readarr.conf > /dev/null <<EOF


server {
  listen        80;
  server_name   $readarr_server;

  location / {
    proxy_pass  http://readarr:8787;
  }
}

EOF


# Create nginx sabnzbd config file
sudo tee /opt/docker/run/nginx/sabnzbd.conf > /dev/null <<EOF


server {
  listen        80;
  server_name   $sabnzbd_server;

  location / {
    proxy_pass  http://sabnzbd:8080;
  }
}

EOF

# Create nginx sabnzbd config file
sudo tee /opt/docker/run/nginx/whisparr.conf > /dev/null <<EOF


server {
  listen        80;
  server_name   $whisparr_server;

  location /whisparr/ {
    proxy_pass  http://whisparr:6969;
  }
}

EOF


# Create nginx sabnzbd config file
sudo tee /opt/docker/run/nginx/qbittorrent.conf > /dev/null <<EOF


server {
  listen        80;
  server_name   $qbittorrent_server;

  location /whisparr/ {
    proxy_pass  http://qbittorrent:8080;
  }
}

EOF

