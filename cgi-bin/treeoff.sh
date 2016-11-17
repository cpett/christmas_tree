#! /bin/bash

# Turns on all the lights

#[0,16,18,19,21,22,23,24,26]
#Channel 1
gpio -1 mode 36 out
gpio -1 write 36 0

gpio -1 mode 38 out
gpio -1 write 38 0

gpio -1 mode 40 out
gpio -1 write 40 0

gpio -1 mode 29 out
gpio -1 write 29 0

gpio -1 mode 31 out
gpio -1 write 31 0

gpio -1 mode 33 out
gpio -1 write 33 0

gpio -1 mode 35 out
gpio -1 write 35 0

gpio -1 mode 37 out
gpio -1 write 37 0
