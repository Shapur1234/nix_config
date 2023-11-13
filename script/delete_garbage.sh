#! /bin/sh

nix-collect-garbage -d
/run/current-system/bin/switch-to-configuration boot
