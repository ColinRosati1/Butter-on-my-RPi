
#!/bin/sh 

# RASPBERRY PI INSTALLER SCRIPT with raspbian or raspbian-lite
# SIMPLE SETUP AND START DEVELOPING!
# ENABLE SSH, Configure IP
# Get Node.js, python
# share RPi as a remote devices to develop remotely on your favourite text ediotr with access to its file folder directory

# 1. make an executable shell script - run sudo chmod +x butter.sh
# 2. sudo sh butter.sh

# This script must be run by "sudo" and must
# have IPADDRESS, GATEWAY, and NETMASK all
# defined on "sudo's" command line, like this:
# sudo IPADDRESS="192.168.1.x" GATEWAY="192.168.1.x" NETMASK="255.255.255.0" /RPI_steup.sh



echo "Lets butter up your RaspberryPi!"
echo "smoothest environment to beging your PI dreams"


#network setup 

# turn off networking
ifdown eth0

echo Type IP
read IPADDRESS
echo gateway - hint 192.168.32.1
read GATEWAY
echo netmask - hint 255.255.255.0
read NETMASK
echo network - hint 192.168.32.0
read NETWORK

# modify the /etc/network/interfaces file
cat >/etc/network/interfaces <<-__END__
auto lo

iface lo inet loopback

auto eth0
iface eth0 inet static
    address $IPADDRESS
    #gateway 192.168.32.1
    gateway $GATEWAY
    # netmask 255.255.240.0
    netmask $NETMASK
    #network 192.168.32.0
  network $NETWORK
    broadcast 192.168.47.255

allow-hotplug wlan0
iface wlan0 inet manual
iface default inet dhcp
__END__

# start networking back up again.
ifup eth0


#ssh enable
sudo /etc/init.d/ssh start


sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get install


#node.js
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -

sudo apt install -y nodejs

node -v

sudo apt-get install python3-pip
    

echo "Now your PI is all buttered up, rebooting."
sudo reboot
