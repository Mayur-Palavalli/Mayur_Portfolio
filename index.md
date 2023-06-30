# Camera Gimbal
I built a self-stabilizing platform that can hold a small camera in order to record a relatively smooth video in spite of bumpy hand movements. The platform is powered by three servos which are controlled by and Arduino Nano and an MPU6050, which has a built in gyroscope and accelerometer. 

<!---
Replace this text with a brief description (2-3 sentences) of your project. This description should draw the reader in and make them interested in what you've built. You can include what the biggest challenges, takeaways, and triumphs from completing the project were. As you complete your portfolio, remember your audience is less familiar than you are with all that your project entails!

| **Engineer** | **School** | **Area of Interest** | **Grade** |
|:--:|:--:|:--:|:--:|
| FirstName LastInitialOnly | School Name | Electrical Engineering | Incoming Senior

**Replace the BlueStamp logo below with an image of yourself and your completed project. Follow the guide [here](https://tomcam.github.io/least-github-pages/adding-images-github-pages-site.html) if you need help.**

![Headstone Image](logo.svg)
-->

<!--- 
# Final Milestone
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

The most challenging part was figuring out why the roll, pitch, and yaw values were drifting (slowly increasing/decreasing) even when I wasn't moving the arduino. It took me a while to figure out that the cause of the drift was in the error values. The amount of error is unique to each particular device, so I had to run the program a couple of times and print out the error values. Replacing the old values with these new ones fixed the issue and stopped the drift, allowing the program to work as intended. 

# Schematics 
<!---
Here's where you'll put images of your schematics. [Tinkercad](https://www.tinkercad.com/blog/official-guide-to-tinkercad-circuits) and [Fritzing](https://fritzing.org/learning/) are both great resoruces to create professional schematic diagrams, though BSE recommends Tinkercad becuase it can be done easily and for free in the browser. 
-->

# Code
<!---
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
<!---
Here's where you'll list the parts in your project. To add more rows, just copy and paste the example rows below.
Don't forget to place the link of where to buy each component inside the quotation marks in the corresponding row after href =. Follow the guide [here]([url](https://www.markdownguide.org/extended-syntax/)) to learn how to customize this to your project needs. 

| **Part** | **Note** | **Price** | **Link** |
|:--:|:--:|:--:|:--:|
| Item Name | What the item is used for | $Price | <a href="https://www.amazon.com/Arduino-A000066-ARDUINO-UNO-R3/dp/B008GRTSV6/"> Link </a> |
|:--:|:--:|:--:|:--:|
| Item Name | What the item is used for | $Price | <a href="https://www.amazon.com/Arduino-A000066-ARDUINO-UNO-R3/dp/B008GRTSV6/"> Link </a> |
|:--:|:--:|:--:|:--:|
| Item Name | What the item is used for | $Price | <a href="https://www.amazon.com/Arduino-A000066-ARDUINO-UNO-R3/dp/B008GRTSV6/"> Link </a> |
|:--:|:--:|:--:|:--:|
-->

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

