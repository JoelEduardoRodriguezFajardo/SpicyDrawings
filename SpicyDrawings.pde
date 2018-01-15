import processing.sound.*;
float redLineX, redDotY; //variables for red slider
float greenLineX, greenDotY; //variables for green slider
float blueLineX, blueDotY; //variables for blue slider
float sizeLineX, sizeDotY; //variables for size slider
float buttonWidth, buttonHeight; //variables for white, black and clear buttons
float lineLength = 255, lineY, size, controlHeight;
float red, green, blue; //variables for the colour values
int sliderSize = 40; //size of the knob on sliders
int totalEffects = 1;
SoundFile[] effect = new SoundFile[totalEffects];
PImage whitebutton;
PImage bluebutton;
PImage greenbutton;
PImage redbutton;
PImage ThickLine;
PImage brightbg;
PImage exit;
String title = "Quit";
PFont titleFont;

boolean imageDisplay = false;
boolean pressed;

void setup() {
  
  fullScreen();
  background(255);
  rectMode(CENTER);

  effect[0] = new SoundFile(this, "Pen_Writing.mp3");

  redLineX = width * 0.125; 
  redDotY = height * 0.04;

  greenLineX = width * 0.1875; 
  greenDotY = height * 0.04 + 255;

  blueLineX = width * 0.25;
  blueDotY = height * 0.04 + 255;

  sizeLineX = width * 0.35;
  sizeDotY = height * 0.04 + 100;

  buttonWidth = width * 0.125;
  buttonHeight = height * 0.04;

  lineY = height * 0.04;

  whitebutton = loadImage("whitebutton.png");
  bluebutton = loadImage("bluebutton.png");
  greenbutton = loadImage("greenbutton.png");
  redbutton = loadImage("redbutton.png");
  ThickLine = loadImage("ThickLine.png");
  brightbg = loadImage("brightbg.png");
  exit = loadImage("exit.png");

  controlHeight = 2 * lineY + lineLength;

  whitebutton.resize(50, 50);
  bluebutton.resize(50, 50);
  greenbutton.resize(50, 50);
  redbutton.resize(50, 50);
  exit.resize(55, 55);
}

void draw() {

  if (mousePressed) {
    if ((mouseX > redLineX - sliderSize / 2 && mouseX < redLineX + sliderSize / 2) && (mouseY > lineY && mouseY < lineY + lineLength)) {
      if (redDotY >= lineY && redDotY <= lineY + lineLength) {
        redDotY = mouseY;
      } else {
        if (redDotY < lineY) {
          redDotY = lineY;
        } else {
          redDotY = lineY + lineLength;
        }
      }
    } else if ((mouseX > greenLineX - sliderSize / 2 && mouseX < greenLineX + sliderSize / 2) && (mouseY > lineY && mouseY < lineY + lineLength)) {
      if (greenDotY >= lineY && greenDotY <= lineY + lineLength) {
        greenDotY = mouseY;
      } else {
        if (greenDotY < lineY) {
          greenDotY = lineY;
        } else {
          greenDotY = lineY + lineLength;
        }
      }
    } else if ((mouseX > blueLineX - sliderSize / 2 && mouseX < blueLineX + sliderSize / 2) && (mouseY > lineY && mouseY < lineY + lineLength)) {
      if (blueDotY >= lineY && blueDotY <= lineY + lineLength) {
        blueDotY = mouseY;
      } else {
        if (blueDotY < lineY) {
          blueDotY = lineY;
        } else {
          blueDotY = lineY + lineLength;
        }
      }
    } else if ((mouseX > sizeLineX - sliderSize / 2 && mouseX < sizeLineX + sliderSize / 2) && (mouseY > lineY && mouseY < lineY + lineLength)) {
      if (sizeDotY >= lineY && sizeDotY <= lineY + lineLength) {
        sizeDotY = mouseY;
      } else {
        if (sizeDotY < lineY) {
          sizeDotY = lineY;
        } else {
          sizeDotY = lineY + lineLength;
        }
      }
    } else if ((mouseX > (width * 0.5 - buttonWidth / 2) && mouseX < (width * 0.5 + buttonWidth / 2)) && (mouseY > (height * 0.18 - buttonHeight / 2) && mouseY < (height * 0.18 + buttonHeight / 2))) { //Black Button
      redDotY = height * 0.04;
      greenDotY = height * 0.04;
      blueDotY = height * 0.04;
    } else if ((mouseX > (width * 0.5 - buttonWidth / 2) && mouseX < (width * 0.5 + buttonWidth / 2)) && (mouseY > (height * 0.24 - buttonHeight / 2) && mouseY < (height * 0.24 + buttonHeight / 2))) { //White Button
      redDotY = height * 0.04 + lineLength;
      greenDotY = height * 0.04 + lineLength;
      blueDotY = height * 0.04 + lineLength;
    } else if ((mouseX > (width * 0.5 - width * 0.07 / 2) && mouseX < (width * 0.5 + width * 0.07 / 2)) && (mouseY > (height * 0.08 - buttonHeight / 2) && mouseY < (height * 0.08 + buttonHeight / 2))) { //Clear Button
      background(255);
    } else if (mouseY >= controlHeight) {
      strokeWeight(size);
      stroke(red, green, blue);
      line(mouseX, mouseY, pmouseX, pmouseY);
      //Sound Affect
    }
  } else {
    pressed = false;
  }

  drawControls();
  sliders();
  
  image(exit, 1900, 20);
  
}
void mousePressed() {
  
  if ((mouseX > 1880 && mouseX < 1920) && (mouseY > 0 && mouseY < 35)){
  exit();
  }
  
  if ((mouseX > 0 && mouseX < width) && (mouseY > controlHeight && mouseY < 1079)) {
    effect[0].play();
    println("Playing song " + 0 + ".");
  }
    println("mouseX = " + str(mouseX) + "mouseY = " + str(mouseY));
}

void mouseReleased() {
  println("Stopping song " + 0 + ".");
  effect[0].stop();
}

void sliders() {
  strokeWeight(3);
  stroke(0);

  imageMode(CORNER);
  image(ThickLine, redLineX, lineY);
  image(ThickLine, greenLineX, lineY);
  image(ThickLine, blueLineX, lineY);
  image(ThickLine, sizeLineX, lineY);

  imageMode(CENTER);
  image(redbutton, redLineX+3, redDotY);
  image(greenbutton, greenLineX+3, greenDotY);
  image(bluebutton, blueLineX+3, blueDotY);
  image(whitebutton, sizeLineX+3, sizeDotY);

  red = lineLength - (redDotY - lineY); //sets the red value between 0 and 255 depending on knob position
  green = lineLength - (greenDotY - lineY); //sets the green value between 0 and 255 depending on knob position
  blue = lineLength - (blueDotY - lineY); //sets the blue value between 0 and 255 depending on knob position
  size = lineLength - (sizeDotY - lineY) + 10; //sets the size value between 10 and 265 depending on knob position
  noStroke();
}

void drawControls() {
  fill(255);
  stroke(0);
  strokeWeight(1);
  imageMode(CENTER);
  image(brightbg, width / 2, controlHeight / 2, width, controlHeight);

  fill(red, green, blue);
  ellipse(width * 0.78, controlHeight / 2, size, size); 

  fill(#C4BEBE);
  rect(width * 0.50, height * 0.085, width * 0.07, buttonHeight, 10);// Clear
  fill(255);
  rect(width * 0.50, height * 0.08, width * 0.07, buttonHeight, 10);

  // Black & White Buttons
  fill (#C4BEBE);
  rect(width * 0.50, height * 0.19, buttonWidth, buttonHeight, 10);//Shadow
  fill(255);
  rect(width * 0.50, height * 0.18, buttonWidth, buttonHeight, 10); //Height = .18

  fill(#3E3838);
  rect(width * 0.50, height * 0.25, buttonWidth, buttonHeight, 10);//Shadow
  fill(0);
  rect(width * 0.50, height * 0.24, buttonWidth, buttonHeight, 10); //Height = .24

  textSize (35);
  text("Clear", width * 0.478, height * 0.09);

  noStroke();
}