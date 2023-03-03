# 'arduino-cli-docker' is a Dockerfile that you can compile and upload to the arduino in a container.

```
docker run -it --name actest --device=/dev/bus/usb:/dev/bus/usb arduino-cli bash
cd /root/
arduino-cli compile --fqbn SeeedJP:Seeed_STM32F4:wioGpsM4 led
arduino-cli upload --fqbn SeeedJP:Seeed_STM32F4:wioGpsM4 led
```

# sample.

- led.ino for Wio-LTE.
