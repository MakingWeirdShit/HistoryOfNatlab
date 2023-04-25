int ledReaderPin = A0;
int val = 0;
int time;
void setup() {
  Serial.begin(9600);
  time = millis();
  // put your setup code here, to run once:

}

void loop() {
  // put your main code here, to run repeatedly:
  val = analogRead(ledReaderPin);

  if(millis() > time + 1500){
    Serial.println(val);
    time = millis();
  }
  
}
