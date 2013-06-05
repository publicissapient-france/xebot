Setup kiosk :
sudo apt-get update && apt-get upgrade -y
sudo apt-get install chromium x11-xserver-utils unclutter
We need to prevent screen from going blank and disable screen saver.
- edit /etc/xdg/lxsession/LXDE/autostart and comment # screen saver line and add those lines:

@xset s off
@xset -dpms
@xset s noblank

@chromium --kiosk --incognito http://some.web.


chromium --incognito --window-position 0,0 --window-size=1000,900 --display=:0 http://github.com &
chromium --new-window --incognito --window-position 1000,0 --window-size=1000,900 --display=:0 http://xebia.fr &
chromium --new-window --incognito --window-position=0,1000 --window-size=2000,300 --display=:0 http://google.com &

