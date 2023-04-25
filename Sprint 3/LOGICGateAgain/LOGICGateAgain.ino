#define aButtonPin 2
#define pinA 8

#define readerPin A0

#define bButtonPin 4
#define pinB 9

int pinOut = 7;

boolean aButtonState = 0;
boolean aButtonLastState = 0;
boolean aLEDOn = 0;

boolean bButtonState = 0;
boolean bButtonLastState = 0;
boolean bLEDOn = 0;

int val = 0;
void setup()
{
  Serial.begin(9600);
  pinMode(aButtonPin, INPUT_PULLUP);
  pinMode(bButtonPin, INPUT_PULLUP);
  pinMode(pinOut, OUTPUT);
  pinMode(pinA, OUTPUT);
  pinMode(pinB, OUTPUT);
}
void loop()
{
  val = analogRead(readerPin);
  //Serial.println(val);
  if( val > 420 && val < 430){ //BLUE LED IS ON
    Serial.println("BLUE");
  } else if(val > 575 && val < 585){ //RED LED IS ON
    Serial.println("RED");
  }
  
  aButtonState = !(digitalRead(aButtonPin));
  if (aButtonState != aButtonLastState) {
    delay(50);
    if (aButtonState == LOW) {
      aLEDOn = !aLEDOn;

    }
    delay(50);

  }
  aButtonLastState = aButtonState;


  bButtonState = !(digitalRead(bButtonPin));
  

  if (bButtonState != bButtonLastState) {
    delay(50);
    if (bButtonState == LOW) {
      bLEDOn = !bLEDOn;

    }
    delay(50);

  }
  bButtonLastState = bButtonState;
  //  boolean pinOutState;
  //  // and
  //  pinOutState =aButtonState & bButtonState;

  digitalWrite(pinA, aLEDOn);
  digitalWrite(pinB, bLEDOn);
  //  digitalWrite(pinOut, pinOutState);
}
