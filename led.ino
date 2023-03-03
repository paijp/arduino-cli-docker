#include	<WioLTEforArduino.h>

WioCellular	wio;
int	hue = 0;


void	setup()
{
	delay(200);
	wio.Init();
}


void	loop()
{
	int	r, g, b;
	
	if (hue < 60) {
		r = 10;
		g = hue * 10 / 6;
		b = 0;
	} else if (hue < 120) {
		r = (120 - hue) * 10 / 60;
		g = 10;
		b = 0;
	} else if (hue < 180) {
		r = 0;
		g = 10;
		b = (hue - 120) * 10 / 60;
	} else if (hue < 240) {
		r = 0;
		g = (240 - hue) * 10 / 60;
		b = 10;
	} else if (hue < 300) {
		r = (hue - 240) * 10 / 60;
		g = 0;
		b = 10;
	} else {
		r = 10;
		g = 0;
		b = (360 - hue) * 10 / 60;
	}
	wio.LedSetRGB(r, g, b);
	hue += 10;
#if 1
	if (hue >= 60)
		hue = 0;
#else
	if (hue >= 360)
		hue = 0;
#endif
	delay(50);
}

