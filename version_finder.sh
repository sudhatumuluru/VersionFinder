#!/bin/sh

IP_ADDR = $1
PEM_FILE = /Users/sreesudha/Desktop/mystuff/SSH-Tester.pem

if [IP_ADDR == ’52.90.199.240’]; then
  USER_ID = 'ec2-user'
else
  USER_ID = 'ubuntu'
fi

RESULT = $(

sudo ssh -p 22 USER_ID@IP_ADDR -i  PEM_FILE 
"OS=for f in $(find /etc -type f -maxdepth 1 \( ! -wholename /etc/os-release ! -wholename /etc/lsb-release -wholename /etc/\*release -o -wholename /etc/\*version \) 2> /dev/null); do echo ${f:5:${#f}-13}; done;
ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/');
VERSION=$(awk '/DISTRIB_RELEASE=/' /etc/*-release | sed 's/DISTRIB_RELEASE=//' | sed 's/[.]0/./');
VERSION=$(awk '{print $3}' /etc/*-release);
echo $OS;
echo $ARCH;
echo $VERSION")

echo $RESULT

#else 
#	sudo ssh -p 22 ec2-user@ec2-54-173-64-71.compute-1.amazonaws.com -i /Users/		sreesudha/Desktop/mystuff/SSH-Tester.pem
#fi


#OS=`for f in $(find /etc -type f -maxdepth 1 \( ! -wholename /etc/os-release ! -wholename /etc/lsb-release -wholename /etc/\*release -o -wholename /etc/\*version \) 2> /dev/null); do echo ${f:5:${#f}-13}; done;`

#ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')
#VERSION=$(awk '/DISTRIB_RELEASE=/' /etc/*-release | sed 's/DISTRIB_RELEASE=//' | sed 's/[.]0/./')
#VERSION=$(awk '{print $3}' /etc/*-release)



