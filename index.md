# Camera Gimbal
I built a self-stabilizing platform that can hold a small camera in order to record a relatively smooth video in spite of bumpy hand movements. The platform is powered by three servos which are controlled by and Arduino Nano and an MPU6050, which has a built in gyroscope and accelerometer. 

| **Engineer** | **School** | **Area of Interest** | **Grade** |
|:--:|:--:|:--:|:--:|
| Mayur P. | Irvington High School | Computer Science | Incoming Junior

<!---
Replace this text with a brief description (2-3 sentences) of your project. This description should draw the reader in and make them interested in what you've built. You can include what the biggest challenges, takeaways, and triumphs from completing the project were. As you complete your portfolio, remember your audience is less familiar than you are with all that your project entails!

| **Engineer** | **School** | **Area of Interest** | **Grade** |
|:--:|:--:|:--:|:--:|
| FirstName LastInitialOnly | School Name | Electrical Engineering | Incoming Senior

**Replace the BlueStamp logo below with an image of yourself and your completed project. Follow the guide [here](https://tomcam.github.io/least-github-pages/adding-images-github-pages-site.html) if you need help.**

![Headstone Image](logo.svg)
-->

# Final Milestone

<iframe width="560" height="315" src="https://www.youtube.com/embed/Lb72Fg6I3-Q" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

My final milestone was the completion of my project by programming what I built in the previous milestone. I programmed the Arduino to use the three servos to stabilize and balance the platform by counteracting the movements I make to the device, essentially making it a gimbal. 

This was by far the most challenging part of the whole project. I ran into many issues while coding and even after coding while trying to get the platform to move properly. To start off, I had the wrong offset (error) values as in the first milestone, but it was slightly tougher to correct. Once I figured it out, the code worked as intended but there was an issue with the device itself. Due to the servos' limited rage of motion, the motor's rotation always starts off from the middle. Since my parts weren't attached in the middle, the servos rotated to an absurd position before working like a gimbal. To fix this, I had to dismantle and mount my parts again but this time making sure that my arms were horizontal only when they were in the middle of the servos' range of motion. 

<!--- 
For your final milestone, explain the outcome of your project. Key details to include are:
- What you've accomplished since your previous milestone
- What your biggest challenges and triumphs were at BSE
- A summary of key topics you learned about
- What you hope to learn in the future after everything you've learned at BSE

**Don't forget to replace the text below with the embedding for your milestone video. Go to Youtube, click Share -> Embed, and copy and paste the code to replace what's below.**

<iframe width="560" height="315" src="https://www.youtube.com/embed/F7M7imOVGug" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
-->


# Second Milestone

<iframe width="560" height="315" src="https://www.youtube.com/embed/Lx24zPu9MfY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

My second milestone was building the whole gimbal box and platform as well as connecting the circuit to power on the Arduino and MPU6050. The three servos are mounted on 3D printed plastic parts using M3 nuts and bolts. 

The gimbal's circuit includes the Arduino and MPU6050, a DC-DC buck converter, a 9V battery, and the three servos. Initially, I had planned to use two batteries that produced 7.4V but the battery holder required for it was far to big to fit along with all the other components that had to stay in the bottom container. To solve this I switched to the 9V battery fixed to the container with velcro, which took up significantly less space. 

The most challenging part of this task was getting the arduino and MPU to turn on, which wasn't happening when I first connected the circuit together. Eventually, I realized that the circuit diagram was missing an important wire connection from the battery's ground cable to the Arduino. After I added this to my circuit the Arduino and MPU turned on as intended. 

<!---
For your second milestone, explain what you've worked on since your previous milestone. You can highlight:
- Technical details of what you've accomplished and how they contribute to the final goal
- What has been surprising about the project so far
- Previous challenges you faced that you overcame
- What needs to be completed before your final milestone 

**Don't forget to replace the text below with the embedding for your milestone video. Go to Youtube, click Share -> Embed, and copy and paste the code to replace what's below.**

<iframe width="560" height="315" src="https://www.youtube.com/embed/y3VAmNlER5Y" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
-->

# First Milestone
<iframe width="560" height="315" src="https://www.youtube.com/embed/_Uh5yGu1_vs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

Building a connected circuit with an arduino and an MPU6050 that was able to track rotation on three axes marked the completion of my first milestone. I used a breadboard and four wires to make connecting the arduino to the MPU6050 easier. A USB cable connected the arduino to the computer. 

The MPU6050 contains a 3-axis accelerometer that measures gravitational acceleration and a 3-axis gyroscope that measures angular velocity. My arduino code made use of both these features to calculate and render sensor orientation. I used the processing development environment to draw a 3D box on the screen that follows my movements with the arduino. 

The first step was to obtain yaw, pitch, and roll readings directly from the gyroscope on the MPU and print them on the serial monitor of the Arduino IDE. Here's the arduino code:

```c++
#include <Wire.h>
const int MPU = 0x68; // MPU6050 I2C address
float AccX, AccY, AccZ;
float GyroX, GyroY, GyroZ;
float accAngleX, accAngleY, gyroAngleX, gyroAngleY, gyroAngleZ;
float roll, pitch, yaw;
float AccErrorX, AccErrorY, GyroErrorX, GyroErrorY, GyroErrorZ;
float elapsedTime, currentTime, previousTime;
int c = 0;
void setup() {
  Serial.begin(19200);
  Wire.begin();                      // Initialize comunication
  Wire.beginTransmission(MPU);       // Start communication with MPU6050 // MPU=0x68
  Wire.write(0x6B);                  // Talk to the register 6B
  Wire.write(0x00);                  // Make reset - place a 0 into the 6B register
  Wire.endTransmission(true);        //end the transmission
  /*
  // Configure Accelerometer Sensitivity - Full Scale Range (default +/- 2g)
  Wire.beginTransmission(MPU);
  Wire.write(0x1C);                  //Talk to the ACCEL_CONFIG register (1C hex)
  Wire.write(0x10);                  //Set the register bits as 00010000 (+/- 8g full scale range)
  Wire.endTransmission(true);
  // Configure Gyro Sensitivity - Full Scale Range (default +/- 250deg/s)
  Wire.beginTransmission(MPU);
  Wire.write(0x1B);                   // Talk to the GYRO_CONFIG register (1B hex)
  Wire.write(0x10);                   // Set the register bits as 00010000 (1000deg/s full scale)
  Wire.endTransmission(true);
  delay(20);
  */

  // This function calculates and prints the IMU error values which is unique to each MPU device. 
  // We need these error values later in the code.
  calculate_IMU_error();
  delay(20);
}
void loop() {
  // Read acceleromter data
  Wire.beginTransmission(MPU);
  Wire.write(0x3B); 
  Wire.endTransmission(false);
  Wire.requestFrom(MPU, 6, true); // Read 6 registers total, each axis value is stored in 2 registers.
  //For a range of +-2g, we need to divide the raw values by 16384.
  AccX = (Wire.read() << 8 | Wire.read()) / 16384.0; // X-axis value
  AccY = (Wire.read() << 8 | Wire.read()) / 16384.0; // Y-axis value
  AccZ = (Wire.read() << 8 | Wire.read()) / 16384.0; // Z-axis value
  // Calculating Roll and Pitch from the accelerometer data
  accAngleX = (atan(AccY / sqrt(pow(AccX, 2) + pow(AccZ, 2))) * 180 / PI) + 0.03; // The last number is AccErrorX and should be changed depending on your error values. 
  accAngleY = (atan(-1 * AccX / sqrt(pow(AccY, 2) + pow(AccZ, 2))) * 180 / PI) - 1.41; // The last number is AccErrorY.
  // Read gyroscope data
  previousTime = currentTime;        // Previous time is stored before the actual time read
  currentTime = millis();            // Current time actual time read
  elapsedTime = (currentTime - previousTime) / 1000; // Divide by 1000 to get seconds
  Wire.beginTransmission(MPU);
  Wire.write(0x43); // Gyro data first register address 0x43
  Wire.endTransmission(false);
  Wire.requestFrom(MPU, 6, true); // Read 4 registers total, each axis value is stored in 2 registers
  GyroX = (Wire.read() << 8 | Wire.read()) / 131.0; // For a 250 deg/s range we have to divide first the raw value by 131.0, according to the datasheet
  GyroY = (Wire.read() << 8 | Wire.read()) / 131.0;
  GyroZ = (Wire.read() << 8 | Wire.read()) / 131.0;

  // Change values according to calculated error values from the calculate_IMU_error() function.
  GyroX = GyroX + 4.42; // Last value is GyroErrorX.
  GyroY = GyroY + 1.50; // Last number is GyroErrorY.
  GyroZ = GyroZ + 0.92; // Last number is GyroErrorZ. 

  // Currently the raw values are in degrees per seconds, deg/s, so we need to multiply by sendonds (s) to get the angle in degrees
  gyroAngleX = gyroAngleX + GyroX * elapsedTime; // deg/s * s = deg
  gyroAngleY = gyroAngleY + GyroY * elapsedTime;
  yaw =  yaw + GyroZ * elapsedTime;
  // Complementary filter - combine acceleromter and gyro angle values
  gyroAngleX = 0.96 * gyroAngleX + 0.04 * accAngleX;
  gyroAngleY = 0.96 * gyroAngleY + 0.04 * accAngleY;

  roll = gyroAngleX;
  pitch = gyroAngleY;
  
  // Print the values on the serial monitor
  Serial.print(roll);
  Serial.print("/");
  Serial.print(pitch);
  Serial.print("/");
  Serial.println(yaw);
}
void calculate_IMU_error() {
  // We can call this funtion in the setup section to calculate the accelerometer and gyro data error. From here we will get the error values used in the above equations printed on the Serial Monitor.
  // The MPU/IMU should be placed flat in order to get the correct values. 
  // Take 200 accelerometer readings.
  while (c < 200) {
    Wire.beginTransmission(MPU);
    Wire.write(0x3B);
    Wire.endTransmission(false);
    Wire.requestFrom(MPU, 6, true);
    AccX = (Wire.read() << 8 | Wire.read()) / 16384.0 ;
    AccY = (Wire.read() << 8 | Wire.read()) / 16384.0 ;
    AccZ = (Wire.read() << 8 | Wire.read()) / 16384.0 ;
    // Add all the readings
    AccErrorX = AccErrorX + ((atan((AccY) / sqrt(pow((AccX), 2) + pow((AccZ), 2))) * 180 / PI));
    AccErrorY = AccErrorY + ((atan(-1 * (AccX) / sqrt(pow((AccY), 2) + pow((AccZ), 2))) * 180 / PI));
    c++;
  }
  //Divide the sum by 200 to get the average error values. 
  AccErrorX = AccErrorX / 200;
  AccErrorY = AccErrorY / 200;
  c = 0;

  // Take 200 gyroscope readings.
  while (c < 200) {
    Wire.beginTransmission(MPU);
    Wire.write(0x43);
    Wire.endTransmission(false);
    Wire.requestFrom(MPU, 6, true);
    GyroX = Wire.read() << 8 | Wire.read();
    GyroY = Wire.read() << 8 | Wire.read();
    GyroZ = Wire.read() << 8 | Wire.read();
    // Add all the readings.
    GyroErrorX = GyroErrorX + (GyroX / 131.0);
    GyroErrorY = GyroErrorY + (GyroY / 131.0);
    GyroErrorZ = GyroErrorZ + (GyroZ / 131.0);
    c++;
  }
  //Divide the sum by 200 to get the average error values.
  GyroErrorX = GyroErrorX / 200;
  GyroErrorY = GyroErrorY / 200;
  GyroErrorZ = GyroErrorZ / 200;
  // Print the error values on the Serial Monitor.
  Serial.print("AccErrorX: ");
  Serial.println(AccErrorX);
  Serial.print("AccErrorY: ");
  Serial.println(AccErrorY);
  Serial.print("GyroErrorX: ");
  Serial.println(GyroErrorX);
  Serial.print("GyroErrorY: ");
  Serial.println(GyroErrorY);
  Serial.print("GyroErrorZ: ");
  Serial.println(GyroErrorZ);
}
```

The serial values had to be stable and close to zero when the IMU was flat. Once this happened, the next step was to create a 3D object  using Processing IDE that tracks the orientation of the MPU. This is the Processing code:

```java
import processing.serial.*;
import java.awt.event.KeyEvent;
import java.io.IOException;
Serial myPort;
String data="";
float roll, pitch,yaw;
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
  // Rotate the object.
  rotateX(radians(-pitch));
  rotateZ(radians(roll));
  rotateY(radians(yaw));
  
  // Create the 3D object. 
  textSize(30);  
  fill(0, 76, 153);
  box (386, 40, 200); // Draw box
  textSize(25);
  fill(255, 255, 255);
  text("Gimbal", -183, 10, 101);
  //delay(10);
  //println("ypr:\t" + angleX + "\t" + angleY); 
  // Print the values to verify that they are correct.
}
// Read data from the Serial Port
void serialEvent (Serial myPort) { 
  // reads the data from the Serial Port up to the character '.' and puts it into the String variable "data".
  data = myPort.readStringUntil('\n');
  // If you got any bytes other than the linefeed:
  if (data != null) {
    data = trim(data);
    // split the string at "/".
    String items[] = split(data, '/');
    if (items.length > 1) {
      //Roll, pitch, and yaw in degrees
      roll = float(items[0]);
      pitch = float(items[1]);
      yaw = float(items[2]);
    }
  }
}
```

The most challenging part was figuring out why the roll, pitch, and yaw values were drifting (slowly increasing/decreasing) even when I wasn't moving the arduino. It took me a while to figure out that the cause of the drift was in the error values. The amount of error is unique to each particular device, so I had to run the program a couple of times and print out the error values. Changing the error values to the the ones calculated in my code fixed the issue and stopped the drift, allowing the program to work as intended. 

# Schematics 

First milestone circuit diagram: 
<br>  

![Milestone 1 circuit diagram](https://raw.githubusercontent.com/Mayur-Palavalli/Mayur_Portfolio/gh-pages/Milestone_1_circuit.png)
<br>  

Second milestone circuit diagram:
<br>  

![Miestone 2 circuit diagram](https://raw.githubusercontent.com/Mayur-Palavalli/Mayur_Portfolio/gh-pages/Milestone_2_circuit.png)

<!---
Here's where you'll put images of your schematics. [Tinkercad](https://www.tinkercad.com/blog/official-guide-to-tinkercad-circuits) and [Fritzing](https://fritzing.org/learning/) are both great resoruces to create professional schematic diagrams, though BSE recommends Tinkercad becuase it can be done easily and for free in the browser. 
-->

<!---
# Code
Here's where you'll put your code. The syntax below places it into a block of code. Follow the guide [here]([url](https://www.markdownguide.org/extended-syntax/)) to learn how to customize it to your project needs. 

```c++
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  Serial.println("Hello World!");
}

void loop() {
  // put your main code here, to run repeatedly:

}
```
-->

# Bill of Materials
Here's where you'll list the parts in your project. To add more rows, just copy and paste the example rows below.
Don't forget to place the link of where to buy each component inside the quotation marks in the corresponding row after href =. Follow the guide [here]([url](https://www.markdownguide.org/extended-syntax/)) to learn how to customize this to your project needs. 

| **Part** | **Note** | **Price** | **Quantitiy** |
|:--:|:--:|:--:|:--:|
| [MPU6050 IMU](https://www.amazon.com/HiLetgo-MPU-6050-Accelerometer-Gyroscope-Converter/dp/B01DK83ZYQ?crid=EPJ36BB9OJLO&keywords=MPU-6050&qid=1664878452&qu=eyJxc2MiOiIyLjkwIiwicXNhIjoiMi45NSIsInFzcCI6IjIuOTcifQ%3D%3D&sprefix=mpu6050%2Caps%2C266&sr=8-3&linkCode=sl1&tag=howto045-20&linkId=a10e35b9e08344c4716bc03a15f70908&language=en_US&ref_=as_li_ss_tl&th=1) | Detects motion and orientation | $6.49 | 1 |
|:--:|:--:|:--:|:--:|
| [MG996R Servo](https://www.amazon.com/4-Pack-MG996R-Torque-Digital-Helicopter/dp/B07MFK266B/ref=dp_prsubs_sccl_1/147-3246084-1098152?pd_rd_w=D4zOx&content-id=amzn1.sym.08119d46-afb1-4cdf-9b04-49551e688996&pf_rd_p=08119d46-afb1-4cdf-9b04-49551e688996&pf_rd_r=EG97922XV3PC24GA4VR5&pd_rd_wg=puR3U&pd_rd_r=def12d0c-28f9-4eea-9749-2875c3ca16ba&pd_rd_i=B07MFK266B&th=1) | Used to move arms that hold the platform | $19.99 (for 4) | 3 |
|:--:|:--:|:--:|:--:|
| [Buck Converter](https://www.amazon.com/DZS-Elec-Adjustable-Electronic-Stabilizer/dp/B06XRN7NFQ/ref=as_li_ss_tl?dchild=1&keywords=LM2596&qid=1609862551&sr=8-9&linkCode=sl1&tag=howto045-20&linkId=842d9c6e89dfe7206324a5e1547fe3ce&language=en_US) | Used to convert 9 Volts from battery to 5 Volts | $5.74 (for 2) | 1 |
|:--:|:--:|:--:|:--:|
| [Arduino Board](https://www.amazon.com/ATmega328P-Microcontroller-Board-Cable-Arduino/dp/B00NLAMS9C/ref=as_li_ss_tl?s=electronics&ie=UTF8&qid=1540015265&sr=1-6&keywords=arduino+nano&linkCode=sl1&tag=howto045-20&linkId=44be140d2f971f2840665fc1b2baa735&language=en_US)| Controls IMU and servos | $8.99 | 1 |
|:--:|:--:|:--:|:--:|
| [Breadboard](https://www.amazon.com/EL-CP-003-Breadboard-Solderless-Distribution-Connecting/dp/B01EV6LJ7G/ref=sr_1_2_sspa?crid=3QE8FDAFNBWF&keywords=breadboard&qid=1688765419&s=industrial&sprefix=breadboard%2Cindustrial%2C147&sr=1-2-spons&sp_csd=d2lkZ2V0TmFtZT1zcF9hdGY&psc=1) | Used to connect IMU and Arduino without soldering | $9.99 (for 3) | 1 |
|:--:|:--:|:--:|:--:|
| [Jumper Wires](https://www.amazon.com/Elegoo-EL-CP-004-Multicolored-Breadboard-arduino/dp/B01EV70C78/ref=sxin_17_pa_sp_search_thematic_sspa?content-id=amzn1.sym.6fd80408-71b6-44da-b059-082bba9089d3%3Aamzn1.sym.6fd80408-71b6-44da-b059-082bba9089d3&crid=1GZV1KTJFBWI1&cv_ct_cx=jumper+wires&keywords=jumper+wires&pd_rd_i=B01EV70C78&pd_rd_r=1defd59d-99a4-4263-bcda-81cfd97cb7d4&pd_rd_w=CpjCe&pd_rd_wg=QDD7R&pf_rd_p=6fd80408-71b6-44da-b059-082bba9089d3&pf_rd_r=Z940NFV2SDTZ6991SEK9&qid=1688765698&s=industrial&sbo=RZvfv%2F%2FHxDF%2BO5021pAnSA%3D%3D&sprefix=jumper+wires%2Cindustrial%2C282&sr=1-3-364cf978-ce2a-480a-9bb0-bdb96faa0f61-spons&sp_csd=d2lkZ2V0TmFtZT1zcF9zZWFyY2hfdGhlbWF0aWM&psc=1) | Used to connect electrical components| $6.98 (for 120) | 30 |
|:--:|:--:|:--:|:--:|
| [9V Battery](https://www.amazon.com/Amazon-Basics-Performance-All-Purpose-Batteries/dp/B00MH4QM1S/ref=sr_1_1_ffob_sspa?keywords=9V+battery&qid=1688767084&rdc=1&sr=8-1-spons&sp_csd=d2lkZ2V0TmFtZT1zcF9hdGY&psc=1) | Used to power the circuit | $12.34 | 1 |
|:--:|:--:|:--:|:--:|
| M3 Bolts and Nuts | Securing sirvos and 3D printed parts | $11.99 | N/A |
|:--:|:--:|:--:|:--:|
| Item Name | What the item is used for | $Price | Quantity |
|:--:|:--:|:--:|:--:|
| Item Name | What the item is used for | $Price | Quantity |
|:--:|:--:|:--:|:--:|
| Item Name | What the item is used for | $Price | Quantity |
|:--:|:--:|:--:|:--:|
| Item Name | What the item is used for | $Price | Quantity |
|:--:|:--:|:--:|:--:|


# Other Resources/Examples

<!---
One of the best parts about Github is that you can view how other people set up their own work. Here are some past BSE portfolios that are awesome examples. You can view how they set up their portfolio, and you can view their index.md files to understand how they implemented different portfolio components.
- [Example 1](https://trashytuber.github.io/YimingJiaBlueStamp/)
- [Example 2](https://sviatil0.github.io/Sviatoslav_BSE/)
- [Example 3](https://arneshkumar.github.io/arneshbluestamp/)

To watch the BSE tutorial on how to create a portfolio, click here.
-->

# Starter Project: Useless Box

<iframe width="560" height="315" src="https://www.youtube.com/embed/MDQ9KzBqOQM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

I made a "useless box" for my starter project. This is a box that closes itself when you try to open it. When the switch on top is flipped, it triggers a small hook to pop out of the lid and flip back the switch before returning inside. The box is powered by three AAA batteries which are connected to a motor. The motor is connected to a circuit which consists of two resistors, a toggle switch, a button switch, and an LED. The turns red when the switch is flipped and green when the hook flips the switch back. 

The toughest part of building this box was soldering all the components to the circuit without damaging other parts or creating a short circuit. I even had to re-solder many times to get the circuit to work since solder needs to be done correctly in order to allow electricity to pass. When the circuit finally worked, it was only a matter of putting the rest of the components together. This happened quite easily since the parts are well designed and fit accurately, making building very easy.   

