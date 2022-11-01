#!/bin/bash

ISSUES_URL="https://github.com/BenjiTrapp/yes-we-scan/issues"


function yes_we_scan() {
    nmap --script nmap-vulners --script=vulscan/vulscan.nse --script-args vulscandb=exploitdb.csv -sV --open -iL scan.txt --oN outputfile.txt
}

function create_gh_issue_with_scan_results() {
    title="Yes we scanned on $(date "+%D %T")"
    body=$(sed '1d;s/"/\\"/g;:a;N;$!ba;s/\n/\\n/g' outputfile.txt)
    payload="{\"title\":\"$title\",\"body\":\"$body\"}"
    curl -i -H "Authorization: token $GITHUB_TOKEN" -d "$payload" $ISSUES_URL
}

function main() {
    yes_we_scan
    create_gh_issue_with_scan_results
}

main