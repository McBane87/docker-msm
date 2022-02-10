FROM danchitnis/xrdp:centos7-xfce

RUN yum update -y && \
	yum install -y \
	chromium mousepad csh unzip \
	libstdc++ compat-libstdc++ libXau libxcb \
	libX11 libXext libXi libXtst \
	lm_sensors java-1.8.0-openjdk \
	&& \
	yum clean all && \
	rm -rf /var/cache/yum
	
COPY data/17.05.06.00_MSM_Linux-x64.zip /tmp/

RUN cd tmp && \
	unzip 17.05.06.00_MSM_Linux-x64.zip && \
	tar -xzf MSM_linux_x64_installer-17.05.06-00.tar.gz && \
	cd disk && \
	/bin/csh -c " \
		setenv setuptype l; \
		setenv upgradesetuptype n; \
		setenv removepopup 0; \
		setenv removesnmp 0; \
		setenv TRAPIND Y; \
		setenv vivaldikeyvalue 2; \
		setenv eventnotificationchoice 2; \
		setenv removesnmp 1; \
		./RunRPM.sh" || true

COPY build/run.sh /
RUN chmod 755 /run.sh

ENTRYPOINT ["/run.sh"]