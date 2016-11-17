#!/bin/bash

# Turns on all the lights

#Channel 1
gpio -1 mode 36 out
gpio -1 write 36 1
gpio -1 mode 38 out
gpio -1 write 38 1
gpio -1 mode 40 out
gpio -1 write 40 1
gpio -1 mode 29 out
gpio -1 write 29 1
gpio -1 mode 31 out
gpio -1 write 31 1
gpio -1 mode 33 out
gpio -1 write 33 1
gpio -1 mode 35 out
gpio -1 write 35 1
gpio -1 mode 37 out
gpio -1 write 37 1
