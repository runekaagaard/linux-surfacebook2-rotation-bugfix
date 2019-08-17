#!/bin/bash

cp linux-surfacebook2-rotation-bugfix.sh /opt/
cp linux-surfacebook2-rotation-bugfix.service /etc/systemd/system/
systemctl enable linux-surfacebook2-rotation-bugfix 
