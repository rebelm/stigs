#!/bin/bash

# Enforces DOS prevention
firewall-cmd --direct --get-rule ipv4 filter IN_public_allow 
rule ipv4 filter IN_public_allow 0 -p tcp -m limit --limit 25/minute --limit-burst 100 -j ACCEPT 
