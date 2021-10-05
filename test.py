import serial
import time
def talk_to_arduino(digit):
    arduino = serial.Serial(port = 'COM4', timeout=5)
    time.sleep(2)
    while True:
        #print ("Enter '1' to turn 'on' the first LED, '2' to turn 'on' the second LED, '3' to turn 'on' the third LED and '4' to turn 'on' the fourth LED.")
        var = digit
        #print("You Entered :", var)
        if(var == '1'):
            arduino.write(str.encode('1'))
            #print("First LED turned on")
            break
        elif(var == '2'):
            arduino.write(str.encode('2'))
            #print("Seconf LED turned on")
            break
        elif(var == '3'):
            arduino.write(str.encode('3'))
            #print("Third LED turned on")
            break
        elif(var == '4'):
            arduino.write(str.encode('4'))
            #print("Fourth LED turned on")
            break
        elif(var == '0'):
            arduino.write(str.encode('0'))
            break