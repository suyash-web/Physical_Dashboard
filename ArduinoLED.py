import serial
import time
led = 0
arduino = serial.Serial(port = 'COM4', timeout=5)
time.sleep(2)

# Keyword 1
def talk_to_arduino(digit):
    global led
    led = str(digit)

# Keyword 2
def loop_through():
    while True:
        arduino.write(str.encode(led))
        break
