#!/bin/bash
wget -O /etc/homeproxy/resources/gfw_list.txt https://raw.githubusercontent.com/itdoginfo/allow-domains/main/Russia/inside-raw.lst
sleep 100 && /etc/init.d/homeproxy restart &
