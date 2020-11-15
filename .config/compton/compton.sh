if [ $(pgrep compton) ]; then
	killall compton
	while [ $(pgrep compton) ]; do sleep 1; done
	compton 
	# --config ~/.config/compton.conf -b
else
	sleep 10
	compton 
	# --config ~/.config/compton.conf -b
fi
