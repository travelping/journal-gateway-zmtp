#!/bin/bash

cp -f journal-gateway-zmtp-control journal-gateway-zmtp-sink journal-gateway-zmtp-source /usr/bin/
cp -f ./misc/journal-gateway-zmtp-s*.service /etc/systemd/system/
cp -f ./remove_old_logs.service /etc/systemd/system/
cp -f ./remove_old_logs.timer /etc/systemd/system/
cp -f ./misc/journal-gateway-zmtp-s*.conf /etc
cp -f ./misc/remove_old_logs.conf /etc
