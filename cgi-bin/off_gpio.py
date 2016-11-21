#!/usr/bin/env python

import RPi.GPIO as GPIO


pin_map = [0,36,38,40,29,31,33,35,37]

GPIO.setmode(GPIO.BOARD)

for i in range(1, 9):
	print(pin_map[i])
	GPIO.setup(pin_map[i], GPIO.OUT)
	GPIO.output(pin_map[i], False)
