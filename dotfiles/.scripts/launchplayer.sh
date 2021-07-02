#!/bin/bash


sudo modprobe -a vmw_vmci vm
sudo systemctl start vmware.service 
sudo systemctl start vmware-networks-server.service 
sudo vmplayer /home/zohar/Documents/Study/y2/q4/SP/doc/Lubuntu\ 20.04.M.1.2/Lubuntu\ 20.04/Lubuntu\ 20.06\ LTS\ 64-bit.vmx

