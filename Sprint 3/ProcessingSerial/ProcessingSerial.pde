/**
 * Efficient Serial Reading (v1.02)
 * GoToLoop (2016-Jan-19)
 *
 * Forum.Processing.org/two/discussion/14534/
 * myport-available-always-0#Item_1
 *
 * Forum.Processing.org/two/discussion/16618/
 * processing-with-arduino-void-serialevent#Item_5
 *
 * Discourse.Processing.org/t/
 * map-function-worked-in-processing-2-and-early-3-
 * but-broke-in-3-5-3-need-guidance/11371/2
 */

import processing.serial.Serial;
import processing.video.*;

static final int PORT_INDEX = 0, BAUDS = 9600;
String myString = "";

PImage queenWilhelmina;
boolean firstplayQueen = false;
Movie kidBaltan;
boolean firstplayKidBaltan = false;
PImage tempFrame;
int mW, mH;
int vScale = 4;
void setup() {
  fullScreen();
  frameRate(24);
  
  final String[] ports = Serial.list();
  printArray(ports);
  new Serial(this, ports[PORT_INDEX], BAUDS).bufferUntil(ENTER);
  
  kidBaltan = new Movie(this, "Kid Baltan.mp4");
  
  //kidBaltan.loop();
  queenWilhelmina = loadImage("data/queenWilhelmina.jpg");
  queenWilhelmina.resize(1920, 0);
}

void draw() {
  
  if(myString.equals("BLUE") == true && !firstplayQueen){
    //kidBaltan.stop();
    //kidBaltan.jump(0);
    firstplayQueen = true;
    background(0, 0, 255);
    image(queenWilhelmina, 0, 0);
  } else if(myString.equals("RED") == true && !firstplayKidBaltan){
  
    background(255, 0, 0);
    firstplayKidBaltan = true;
    kidBaltan.play();
    
    
  }
  
  if(kidBaltan.available()){
    kidBaltan.read();
    mW = kidBaltan.width;
    mH = kidBaltan.height;
    tempFrame = kidBaltan.get();
  
  image(tempFrame, 0, 0);
  }
  
  //tempFrame = kidBaltan.get();
  
  //image(tempFrame, 0, 0);
}

void serialEvent(final Serial s) {
  myString = s.readString().trim();
  //redraw = true;
}

//void movieevent(Movie m){
//  m.read();
  
//}
