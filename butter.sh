#!/bin/sh	

# RASPBERRY PI INSTALLER SCRIPT with raspbian or raspbian-lite
# SIMPLE SETUP AND START DEVELOPING!
# ENABLE SSH, Configure IP
# Get Node.js, python
# share RPi as a remote devices to develop remotely on your favourite text ediotr with access to its file folder directory
# enable LCD screen * optional

# 1. make an executable shell script - run sudo chmod +x RPI_setup.sh
# 2. sh RPI_setup.sh

# This script must be run by "sudo" and must
# have IPADDRESS, GATEWAY, and NETMASK all
# defined on "sudo's" command line, like this:
# sudo IPADDRESS="192.168.1.x" GATEWAY="192.168.1.x" NETMASK="255.255.255.0" /RPI_steup.sh
# sudo IPADDRESS="192.168.1.x"



echo "Lets butter up your RaspberryPi!"
echo "smoothest environment to beging your PI dreams"


#network setup 

# turn off networking
ifdown eth0

echo Type IP
read IPADDRESS

# modify the /etc/network/interfaces file
cat >/etc/network/interfaces <<-__END__
auto lo

iface lo inet loopback

auto eth0
iface eth0 inet static
    address $IPADDRESS
    gateway 192.168.32.1
    netmask 255.255.240.0
    network 192.168.32.0
    broadcast 192.168.47.255

allow-hotplug wlan0
iface wlan0 inet manual
iface default inet dhcp
__END__

# start networking back up again.
ifup eth0


sudo apt-get update && sudo apt-get upgrade -y


#node.js
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -

sudo apt install -y nodejs

node -v

#vnc server
sudo apt-get install netatalk
sudo apt-get install avahi-daemon
sudo update-rc.d avahi-daemon defaults

sudo cat >/etc/avahi/services/afpd.service <<-__END__
<?xml version="1.0" standalone='no'?><!--*-nxml-*-->
<!DOCTYPE service-group SYSTEM "avahi-service.dtd">
<service-group>
   <name replace-wildcards="yes">%h</name>
   <service>
      <type>_afpovertcp._tcp</type>
      <port>548</port>
   </service>
</service-group>
__END__

sudo /etc/init.d/avahi-daemon restart

sudo apt-get install tightvncserver
vncserver


##################################################### This might not work ############################
cd /etc/init.d && sudo cat >tightvncserver <<-__END__
#!/bin/bash
# /etc/init.d/tightvncserver
#

# Carry out specific functions when asked to by the system
case "$1" in
start)
    su pi -c '/usr/bin/vncserver -geometry 1440x900'
    echo "Starting VNC server "
    ;;
stop)
    pkill vncserver
    echo "VNC Server has been stopped (didn't double check though)"
    ;;
*)
    echo "Usage: /etc/init.d/blah {start|stop}"
    exit 1
    ;;	
esac

exit 0
__END__

sudo chmod +x tightvncserver
sudo pkill Xtightvnc

ps aux | grep vnc

sudo /etc/init.d/tightvncserver start
cd /etc/init.d
sudo update-rc.d tightvncserver defaults

