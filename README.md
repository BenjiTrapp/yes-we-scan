# Keep calm and yes we scan

This is a GitHub Action powered [nmap](https://nmap.org/) scanner. This scanner will apply a [vulnersCom/nmap-vulners](https://github.com/vulnersCom/nmap-vulners) vulnerability scan against all hosts that are placed in `scan.txt`. 

After performing a push into the master branch, the GitHub Workflow get's triggered. After performing a successful scan of the targets, the results will be posted as a [GitHub issue](https://github.com/BenjiTrapp/yes-we-scan/issues).



<p align="center">
<img width="200" src="/static/yws.jpg">
</p>


Like what you see here? Please leave a star and check out my [blog](https://benjitrapp.github.io).