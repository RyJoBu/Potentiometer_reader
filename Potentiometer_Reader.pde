
import processing.serial.*;

Serial myPort;
String inny;
int count = 0;
float angle;

void setup() {
  size(600, 600);
  myPort = new Serial(this, "COM5", 9600);
}

void draw() {
  background(120);
  println(angle);
  translate(width/2, height/2);
  float convert = (angle+1)/(1024*4/3);
  fill(220);
  ellipse(0,0, width/4, height/4);
  rotate(QUARTER_PI);
  rotate(convert*TWO_PI);
  line(0, 0, 0, width*3/16);
  translate(0, width*3/16);
  text(int(angle), -ceil(str(angle).length()/2)*4, 12);
}

void serialEvent(Serial p) {
  String temp = p.readStringUntil(10);
  if(temp != null && temp != inny)
    inny = trim(temp);

  if(inny != null)
    angle = float(Integer.parseInt(inny));
}
