#!/bin/sh

# IFACE=$(ip addr | grep tun | awk '{print $2}')
ip_route=$(ip route get 1)
is_tun=$(ip route get 1 | grep "tun0" | awk '{print $2}')
# VPN_SYMBOL="賓"
VPN_SYMBOL="\uf49c"
SIZE="12"
ON_COLOR="55aa55"
# OFF_COLOR="333333"
OFF_COLOR="FF0000"
symbol=${VPN_SYMBOL}
color=${OFF_COLOR}

if [ "$is_tun" ]; then
  symbol=${VPN_SYMBOL}
  color=${ON_COLOR}
fi

echo -e "%{F#$color}$symbol%{F-}"
