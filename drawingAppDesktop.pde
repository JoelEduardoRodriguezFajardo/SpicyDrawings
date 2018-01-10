float redLineX, redLineY, redLineLength, redDotY; //variables for red slider
float greenLineX, greenLineY, greenLineLength, greenDotY; //variables for green slider
float blueLineX, blueLineY, blueLineLength, blueDotY; //variables for blue slider
float sizeLineX, sizeLineY, sizeLineLength, sizeDotY; //variables for size slider
float buttonWidth, buttonHeight; //variables for white and black buttons

float red, green, blue; //variables for the colour values

int sliderSize = 40; //size of the knob on sliders
float size; //size of pen when drawing

float lastDrawX = -1, lastDrawY = -1;

PImage whitebutton;
PImage bluebutton;
PImage greenbutton;
PImage redbutton;
PImage ThickLine;
PImage brightbg;

boolean imageDisplay = false;
boolean pressed;
float controlHeight;

void setup() {
  fullScreen();
  background(255);
  rectMode(CENTER);
 


  redLineX = width * 0.125; 
  redLineY = height * 0.04; 
  redLineLength = 255; 
  redDotY = height * 0.04;
  
  greenLineX = width * 0.1875; 
  greenLineY = height * 0.04; 
  greenLineLength = 255;
  greenDotY = height * 0.04 + 255;
  
  blueLineX = width * 0.25;
  blueLineY = height * 0.04; 
  blueLineLength = 255; 
  blueDotY = height * 0.04 + 255;
  
  sizeLineX = width * 0.35;
  sizeLineY = height * 0.04; 
  sizeLineLength = 255;
  sizeDotY = height * 0.04 + 100;
  
  buttonWidth = width * 0.125;
  buttonHeight = height * 0.04;
  
  whitebutton = loadImage("whitebutton.png");
  bluebutton = loadImage("bluebutton.jpg");
  greenbutton = loadImage("greenbutton.png");
  redbutton = loadImage("redbutton.png");
  ThickLine = loadImage("ThickLine.png");
  brightbg = loadImage("brightbg.jpg");
  
  if ((height / 1.75 / 2) + redLineY > 255 + 2 * redLineY) {
    controlHeight = (height / 1.75) / 2 + 2 * redLineY;
  } else {
    controlHeight = 2 * redLineY + 255;
  }
  
  whitebutton.resize(50,50);
  bluebutton.resize(50,50);
  greenbutton.resize(50,50);
  redbutton.resize(50,50);
}

void draw() {
  
      fill(#7E7878);
  createFont ("AGaramondPro-Regular", 50);
  rect(1839,0,1919,44); {
  textSize(10);
  text("Quit", 1839, 44);
  
  if (mousePressed) {
    if ((mouseX > redLineX - sliderSize / 2 && mouseX < redLineX + sliderSize / 2) && (mouseY > redLineY && mouseY < redLineY + redLineLength)) {
      if (redDotY >= redLineY && redDotY <= redLineY + redLineLength) {
        redDotY = mouseY;
      } else {
        if (redDotY < redLineY) {
          redDotY = redLineY;
        } else {
          redDotY = redLineY + redLineLength;
        }
      }
    } else if ((mouseX > greenLineX - sliderSize / 2 && mouseX < greenLineX + sliderSize / 2) && (mouseY > greenLineY && mouseY < greenLineY + greenLineLength)) {
      if (greenDotY >= greenLineY && greenDotY <= greenLineY + greenLineLength) {
        greenDotY = mouseY;
      } else {
        if (greenDotY < greenLineY) {
          greenDotY = greenLineY;
        } else {
          greenDotY = greenLineY + greenLineLength;
        }
      }
    } else if ((mouseX > blueLineX - sliderSize / 2 && mouseX < blueLineX + sliderSize / 2) && (mouseY > blueLineY && mouseY < blueLineY + blueLineLength)) {
      if (blueDotY >= blueLineY && blueDotY <= blueLineY + blueLineLength) {
        blueDotY = mouseY;
      } else {
        if (blueDotY < blueLineY) {
          blueDotY = blueLineY;
        } else {
          blueDotY = blueLineY + blueLineLength;
        }
      }
    } else if ((mouseX > sizeLineX - sliderSize / 2 && mouseX < sizeLineX + sliderSize / 2) && (mouseY > sizeLineY && mouseY < sizeLineY + sizeLineLength)) {
      if (sizeDotY >= sizeLineY && sizeDotY <= sizeLineY + sizeLineLength) {
        sizeDotY = mouseY;
      } else {
        if (sizeDotY < sizeLineY) {
          sizeDotY = sizeLineY;
        } else {
          sizeDotY = sizeLineY + sizeLineLength;
        }
      }
    } else if ((mouseX > (width * 0.5 - buttonWidth / 2) && mouseX < (width * 0.5 + buttonWidth / 2)) && (mouseY > (height * 0.20 - buttonHeight / 2) && mouseY < (height * 0.20 + buttonHeight / 2))) { //Black Button
      redDotY = height * 0.04;
      greenDotY = height * 0.04;
      blueDotY = height * 0.04;
    } else if ((mouseX > (width * 0.5 - buttonWidth / 2) && mouseX < (width * 0.5 + buttonWidth / 2)) && (mouseY > (height * 0.26 - buttonHeight / 2) && mouseY < (height * 0.26 + buttonHeight / 2))) { //White Button
      redDotY = height * 0.04 + redLineLength;
      greenDotY = height * 0.04 + greenLineLength;
      blueDotY = height * 0.04 + blueLineLength;
    } else if ((mouseX > (width * 0.5 - width * 0.07 / 2) && mouseX < (width * 0.5 + width * 0.07 / 2)) && (mouseY > (height * 0.08 - buttonHeight / 2) && mouseY < (height * 0.08 + buttonHeight / 2))) { //Clear Button
      if (imageDisplay) {
        background(255);
        imageDisplay = false;
      } else {
        background(255);
      }
      pressed = true;
    }
    
    if (mouseY >= controlHeight) {
      fill(red, green, blue);
      if (lastDrawX > 0 && lastDrawY > 0) {
        checkTouch(mouseX, mouseY);
      } else {
        lastDrawX = mouseX;
        lastDrawY = mouseY;
      }
      ellipse(mouseX, mouseY, size, size);
      fill(0);
    }
  } else {
    lastDrawX = -1;
    lastDrawY = -1;
    
    pressed = false;
  }
  
  drawControls();
  sliders();
  
  print("\nmouseX = " + str(mouseX));
  print("\nmouseY = " + str(mouseY)); }}
  
void checkTouch(int currentX, int currentY) {
  if ((currentX < lastDrawX - size / 2) || (currentX > lastDrawX + size / 2) || (currentY < lastDrawY - size / 2) || (currentY > lastDrawY + size / 2)) {
    strokeWeight(size);
    stroke(red, green, blue);
    line(lastDrawX, lastDrawY, currentX, currentY);
  }
  
  lastDrawX = currentX;
  lastDrawY = currentY;
  
  noStroke();
}

void sliders() {
  strokeWeight(3);
  stroke(0);
 {
   
   
  
  
  fill(255, 0, 0); //draw red slider
  imageMode(CORNER);
  image(ThickLine,redLineX,redLineY);
  imageMode(CENTER);
    image(redbutton,redLineX+3,redDotY);
  
  fill(0, 255, 0); //draw green slider
  imageMode(CORNER);
  image(ThickLine,greenLineX,greenLineY);
  imageMode(CENTER);
    image(greenbutton,greenLineX+3,greenDotY);
  
  fill(0, 0, 255); //draw blue slider
  imageMode(CORNER);
  image(ThickLine,blueLineX,blueLineY);
  imageMode(CENTER);
    image(bluebutton,blueLineX+3,blueDotY);
  
  fill(255); //draw size slider
  imageMode(CORNER);
  image(ThickLine,sizeLineX,sizeLineY);
  imageMode(CENTER);
   image(whitebutton,sizeLineX+3,sizeDotY);
  
  red = redLineLength - (redDotY - redLineY); //sets the red value between 0 and 255 depending on knob position
  green = greenLineLength - (greenDotY - greenLineY); //sets the green value between 0 and 255 depending on knob position
  blue = blueLineLength - (blueDotY - blueLineY); //sets the blue value between 0 and 255 depending on knob position
  size = sizeLineLength - (sizeDotY - sizeLineY) + 10; //sets the size value between 10 and 265 depending on knob position
    noStroke();}}

void drawControls() {
  
  fill(255);
  stroke(0);
  strokeWeight(1);
  image(brightbg,width / 2, controlHeight / 2, width, controlHeight);
  
  fill(red, green, blue);
  ellipse(width * 0.78, controlHeight / 2, size, size); 
  
  fill(#C4BEBE);
    rect(width * 0.50, height * 0.085, width * 0.07, buttonHeight, 10);// Clear
    fill(255);
  rect(width * 0.50, height * 0.08, width * 0.07, buttonHeight, 10);
  
  // Black & White Buttons
   fill (#C4BEBE);
    rect(width * 0.50, height * 0.21, buttonWidth, buttonHeight, 10);//Shadow
   fill(255);
  rect(width * 0.50, height * 0.20, buttonWidth, buttonHeight, 10); //Height = .20


  fill(#3E3838);
    rect(width * 0.50, height * 0.27, buttonWidth, buttonHeight, 10);//Shadow
   fill(0);
  rect(width * 0.50, height * 0.26, buttonWidth, buttonHeight, 10); //Height = .26

  
  textSize (35);
  text("Clear", 917, 99);
  
  noStroke();
}