#!/bin/sh

echo "Starting..."

if [ ! -f '/home/user/.autodl/autodl.cfg' ]; then
    echo "Creating config file"
    cp '/autodl.cfg' '/home/user/.autodl/autodl.cfg'
else
    echo "Config file already exists"
fi

irssi