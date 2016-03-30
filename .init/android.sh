#!/usr/bin/sh

groupadd sdkusers
gpasswd -a kekke sdkusers
chown -R :sdkusers /opt/android-sdk/
chmod -R g+w /opt/android-sdk/
