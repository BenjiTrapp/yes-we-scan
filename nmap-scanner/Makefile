# vim:ft=make:

.PHONY : all start github

all: github

build:
		docker build -t nmap-scanner .

clean:
		docker rmi nmap-scanner

stop:
		docker rm -f nmap-scanner

browser:
		browse 'http://localhost:9020/vnc.html' | sh -e
