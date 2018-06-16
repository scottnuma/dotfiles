#!/bin/bash
echo OKAY
ln -sf $(shell pwd)/polybar/polybar.config ~/.config/polybar/config
ln -sf $(shell pwd)/polybar/startup_launch ~/.config/polybar/startup_launch.sh
