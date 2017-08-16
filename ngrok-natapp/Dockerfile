FROM centos:6.7
MAINTAINER xubowen "xbw@ecfun.cc"

RUN yum update -y glibc-common

RUN yum install -y sudo passwd openssh-server openssh-clients tar screen crontabs strace telnet perl libpcap bc patch ntp dnsmasq unzip pax which

RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

RUN (yum install -y hiera lsyncd sshpass rng-tools)

RUN (service sshd start; \
	 sed -i 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config; \
	 sed -i 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config; \
	 sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config; \
	 sed -i 's/enabled=0/enabled=1/' /etc/yum.repos.d/CentOS-Base.repo)

RUN (mkdir -p /root/.ssh/; \
	 rm -f /var/lib/rpm/.rpm.lock; \
	 echo "StrictHostKeyChecking=no" > /root/.ssh/config; \
	 echo "UserKnownHostsFile=/dev/null" >> /root/.ssh/config)

RUN echo "root:password" | chpasswd
COPY shadowsocks-go.sh /home
RUN chmod +x /home/shadowsocks-go.sh && /home/shadowsocks-go.sh

RUN (wget http://download.natapp.cn/assets/downloads/clients/2_3_4/natapp_linux_amd64_2_3_4.zip)
RUN (unzip natapp_linux_amd64_2_3_4.zip)
RUN (chmod a+x natapp)


COPY ss.sh /home
RUN chmod +x /home/ss.sh
EXPOSE 22
CMD /home/ss.sh