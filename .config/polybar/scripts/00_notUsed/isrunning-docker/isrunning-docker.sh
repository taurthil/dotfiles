#!/bin/sh

if [ "$(systemctl is-active docker.service)" = "active" ]; then
    echo -e "\uf308"
fi
