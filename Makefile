# vim:ft=make:

.PHONY : build all stop

all: build

build:
		docker build -t nmap-scanner .

clean:
		docker rmi nmap-scanner

stop:
		docker rm -f nmap-scanner
