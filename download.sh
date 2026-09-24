#!/bin/bash
# Code apolo1061

USER="Apolo1061"
mkdir -p repos_$USER
cd repositorios_$USER

pagina=1
while : ; do
  urls=$(curl -s "https://api.github.com/users/$USER/repos?per_page=100&page=$pagina" | grep -oP '"clone_url": "\K[^"]+')

  if [ -z "$urls" ]; then
    break
  fi

  for url in $urls; do
    git clone "$url"
  done

  pagina=$((pagina + 1))
done

echo "Se a descargado todo"
