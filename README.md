# Butter-on-my-RPi
Butter on my RPi is a shell script to initialize RaspberryPis time consuming setup to began dreaming with Pi

## Intro
I made this shell script to make setting up a Raspberry Pi easy as pie. I was tired of repeating myself everytime I had to start a RPi.
Making SSH, Static IP's easy to begin working remotely.

Note this is note a secure way to work with RPI, please proctect yourself and those dear to you

## Usage

To use this you need :
  a Fresh RPI with Raspbian, or Raspbian Lite. 
  An Ethernet cord connected to a router for network connection.
  A Monitor.
  Remote access via another computer.
  

Begin by downloading this code
`git clone https://github.com/ColinRosati1/Butter-on-my-RPi`

Change Directory
`cd Butter-on-my-RPi`

make script executable
`sudo chmod +x butter.sh`

run script as admin to being downloading
`sudo butter.sh`

You will be prompted to enter an IP address, gateway, and network
Typically your netowrk should be something like:.
IP `192.168.1.23` .
Gateway `192.168.1.1` .
NETMASK `255.255.255.255.0` .
Network `192.168.1.0`.

If you are using LINUX you can check the gateway and network with `sudo route -ne`.

This install process can take a while




