
#!/bin/bash
# dependencies: openvpn, rofi

cd /etc/openvpn

VPN=$(ls *.ovpn | rofi -dmenu -p "VPN: ")

[ -z "$VPN" ] && exit

urxvt -e /bin/bash -c "sudo openvpn /etc/openvpn/$VPN"

exit
