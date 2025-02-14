import processing.serial.*;
import java.awt.event.KeyEvent;
import java.io.IOException;
Serial myPort;
String data="";
float roll, pitch, yaw;
void setup() {
  size (1500, 850, P3D);
  myPort = new Serial(this, "/dev/cu.usbserial-A10LT4GS", 19200); // starts the serial communication
  myPort.bufferUntil('\n');
}
void draw() {
  translate(width/2, height/2, 0);
  background(0);
  textSize(22);
  text("Roll: " + int(roll) + "     Pitch: " + int(pitch) + "     Yaw: " + int(yaw), -100, 265);
  // Rotate the object
  rotateX(radians(-pitch));
  rotateZ(radians(roll));
  rotateY(radians(yaw));

  // 3D 0bject
  textSize(30);
  fill(0, 76, 153);
  box (386, 40, 200); // Draw box
  textSize(25);
  fill(255, 255, 255);
  text("Gimbal", -183, 10, 101);
  //delay(10);
  //println("ypr:\t" + angleX + "\t" + angleY); // Print the values to check whether we are getting proper values
}
// Read data from the Serial Port
void serialEvent (Serial myPort) {
  // reads the data from the Serial Port up to the character '.' and puts it into the String variable "data".
  data = myPort.readStringUntil('\n');
  // if you got any bytes other than the linefeed:
  if (data != null) {
    data = trim(data);
    // split the string at "/"
    String items[] = split(data, '/');
    if (items.length > 1) {
      //--- Roll,Pitch in degreess
      roll = float(items[0]);
      pitch = float(items[1]);
      yaw = float(items[2]);
    }
  }
}
