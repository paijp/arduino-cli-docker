FROM centos:7

# usage:
#	docker run -it --name actest --device=/dev/bus/usb:/dev/bus/usb arduino-cli bash
#	cd /root/
#	arduino-cli compile --fqbn SeeedJP:Seeed_STM32F4:wioGpsM4 led
#	arduino-cli upload --fqbn SeeedJP:Seeed_STM32F4:wioGpsM4 led

#ADD arduino-cli_0.29.0_Linux_64bit.tar.gz /usr/local/bin/
ADD led.ino /root/led/

RUN set -x &&\
	yum install -y wget libusbx-devel

RUN set -x &&\
	cd /usr/local/bin/ &&\
	wget 'https://downloads.arduino.cc/arduino-cli/arduino-cli_0.29.0_Linux_64bit.tar.gz' &&\
	tar xaf arduino-cli_0.29.0_Linux_64bit.tar.gz &&\
	rm arduino-cli_0.29.0_Linux_64bit.tar.gz

RUN set -x &&\
	arduino-cli cache clean &&\
	arduino-cli core update-index --additional-urls https://www.seeed.co.jp/package_SeeedJP_index.json &&\
	arduino-cli core install SeeedJP:Seeed_STM32F4 --additional-urls https://www.seeed.co.jp/package_SeeedJP_index.json &&\
	arduino-cli lib install "Wio LTE for Arduino"

CMD bash


