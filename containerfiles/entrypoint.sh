#!/bin/bash

function yes_we_scan() {
    nmap --script=vulscan/vulscan.nse --script-args vulscandb=exploitdb.csv -sV --open -iL scan.txt --oN /tmp/outputfile.txt
}

function main() {
    yes_we_scan
}

main
