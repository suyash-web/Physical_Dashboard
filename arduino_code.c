//declaring variables

int LED_1 = 13;
int LED_2 = 12;
int LED_3 = 11;
int LED_4 = 10;
int data;           // Variable to store data
void setup()
{
Serial.begin(9600);              //setting baud rate for communication
pinMode(LED_1,OUTPUT);          //Pins set as output
pinMode(LED_2,OUTPUT);
pinMode(LED_3,OUTPUT);
pinMode(LED_4,OUTPUT);

void loop()
{
  while(Serial.available())                                 //check if data is available
  {
  data = Serial.read();                                       //while data is available read the data
  }
  if(data == '1')                                                  //if data is value '1'
  {
    digitalWrite(LED_1,HIGH);                                //turn LED 1 on
  }
  else if(data == '2')                                          //if data is value '2'
  {
    digitalWrite(LED_2,HIGH);                                 //turn LED 2 on
  }
  else if(data == '3')                                        //if data is value '3'
  {
    digitalWrite(LED_3, HIGH);                                    //turn LED 3 on
  }
  else if(data == '4')                                          //if data is value '4'
  {
    digitalWrite(LED_4, HIGH);                                      //turn LED 3 on
  }
}
