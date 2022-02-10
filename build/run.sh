#!/bin/bash

# Make sure pidfiles are gone
echo -e "cleanup /run and /tmp...\n"
rm -rf /run/*
rm -rf /tmp/*

echo -e "starting vivaldiframeworkd...\n"
/etc/init.d/vivaldiframeworkd start

echo -e "starting xrdp services...\n"
xrdp-sesman && xrdp -n