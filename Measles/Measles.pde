//Global Variables
int appWidth, appHeight, smallerDimension;
float faceX, faceY, faceDiameter;
float backgroundX, backgroundY, backgroundWidth, backgroundHeight;
float leftEyeX, leftEyeY, rightEyeX, rightEyeY, eyeDimater;
float noseX1, noseY1, noseX2, noseY2, noseX3, noseY3;
float mouthX1, mouthY1, mouthX2, mouthY2, mouthOpen, mouthReset;
float measleX, measleY, measleDiameter;
float button1X, button1Y, button2X, button2Y, button3X, button3Y, buttonSide;
color red=#E81717, green=#51E817, blueInk=#1769E8, resetColour=#FFFFFF;
color hoverOverColour=resetColour;
String start="START", stop="STOP", quit="X";
PFont buttonFont;
boolean measlesON=false;
//
void setup() {
  size( 600, 400 ); //fullScreen;
  appWidth = width; //displayWidth
  appHeight = height; //displayHeight
  //Ternary Operator
  smallerDimension = (appWidth >= appHeight) ? appHeight : appWidth;
  println("Smaller Dimension is", smallerDimension); //Started as local variable
  //
  //Population
  faceX = appWidth*1/2;
  faceY = appHeight*1/2;
  faceDiameter = smallerDimension;
  backgroundX = faceX - faceDiameter*1/2;
  backgroundY = faceY - faceDiameter*1/2;
  backgroundWidth = faceDiameter;
  backgroundHeight = faceDiameter;
  leftEyeX = backgroundX+smallerDimension*5/8;
  leftEyeY = backgroundY+smallerDimension*1/4;
  eyeDimater = smallerDimension*2/16;
  rightEyeX = backgroundX+smallerDimension*6/16;
  rightEyeY = leftEyeY;
  noseX1 = faceX;
  noseY1 = rightEyeY;
  noseX2 = leftEyeX;
  noseY2 = faceY;
  noseX3 = rightEyeX;
  noseY3 = faceY;
  mouthX1 = noseX2;
  mouthY1 = backgroundY+smallerDimension*4/6;
  mouthX2 = noseX3;
  mouthY2 = mouthY1;
  mouthOpen = smallerDimension*1/8;
  mouthReset = smallerDimension/smallerDimension; //1=reset
  buttonFont = createFont("Centaur", 55);
  //
  //DIVs
  rect( backgroundX, backgroundY, backgroundWidth, backgroundHeight ); //Circle ONLY
  ellipse( faceX, faceY, faceDiameter, faceDiameter );
  //4 Inscribed buttons on the background square not on the circle
  //Solve Isolceles leg length to find rect() width and height
  //2x^2 = radius^2
  buttonSide = smallerDimension/2-sqrt(sq(smallerDimension/2)/2);
  button1X = backgroundX;
  button1Y = backgroundY;
  button2X = backgroundX+faceDiameter-buttonSide;
  button2Y = button1Y;
  button3X = button2X;
  button3Y = backgroundY+faceDiameter-buttonSide;
  println(backgroundX, smallerDimension, smallerDimension/2, sq( smallerDimension/2 ), sq( smallerDimension/2 ) /2, sqrt( sq( smallerDimension/2 ) /2 ), smallerDimension/2-sqrt(sq(smallerDimension/2)/2) );
  //
} //End setup
//
void draw() {
  //Text Code
  color hoverOverColour=resetColour;
if ( mouseX>button1X && mouseX<button1X+buttonSide && mouseY>button1Y && mouseY<button1Y+buttonSide ) { //button1
  hoverOverColour = green;
  fill ( hoverOverColour );
  rect( button1X, button1Y, buttonSide, buttonSide );
  fill( resetColour );
} else if  ( mouseX>button2X && mouseX<button2X+buttonSide && mouseY>button2Y && mouseY<button2Y+buttonSide ) { //button2
  hoverOverColour = green;
  fill ( hoverOverColour );
  rect( button2X, button2Y, buttonSide, buttonSide );
} else if  ( mouseX>button3X && mouseX<button3X+buttonSide && mouseY>button3Y && mouseY<button3Y+buttonSide ) { //button3
  hoverOverColour = red;
  fill ( hoverOverColour );
  rect( button3X, button3Y, buttonSide, buttonSide );
} else { //no buttons
  fill ( resetColour );
  rect( button1X, button1Y, buttonSide, buttonSide );
  rect( button2X, button2Y, buttonSide, buttonSide );
  rect( button3X, button3Y, buttonSide, buttonSide );
 }
  //
  fill(blueInk); //ink
  textAlign(CENTER, CENTER); //Align X&Y, see Processing.org / Reference
  //Values: [ LEFT | CENTER | RIGHT ] & [ TOP | CENTER | BOTTOM | BASELINE ]
  int size = 20;
  textFont(buttonFont, size );
  //start="Start", stop="STOP", quit="X"
  text( start, button1X, button1Y, buttonSide, buttonSide );
  text( stop, button2X, button2Y, buttonSide, buttonSide );
  text( quit, button3X, button3Y, buttonSide, buttonSide );
  

  ellipse ( leftEyeX, leftEyeY, eyeDimater, eyeDimater ); //Left Eye
  ellipse ( rightEyeX, rightEyeY, eyeDimater, eyeDimater ); //Right Eye
  triangle( noseX1, noseY1, noseX2, noseY2, noseX3, noseY3 ); //Nose
  strokeWeight(mouthOpen);
  line( mouthX1, mouthY1, mouthX2, mouthY2 ); //mouth
  strokeWeight(mouthReset); //1=reset
  //
  color measleColour = color( 255, random(0, 84), random(0, 103) );
  fill(measleColour);
  measleDiameter = random( smallerDimension*1/100, smallerDimension*1/30 );
  measleX = random( backgroundX+(measleDiameter/2), (backgroundX+backgroundWidth)-(measleDiameter/2) );
  measleY = random( backgroundY+(measleDiameter/2), (backgroundY+backgroundHeight)-(measleDiameter/2) );
  println( "Start", measleX, measleY, measleDiameter );
  if ( measleX <= button1X+buttonSide+(measleDiameter/2) && measleY <= button1Y+buttonSide+(measleDiameter/2)) {
    println("\t\tXhere", measleX, button1X+buttonSide);
    measleX = random( button1X+buttonSide+(measleDiameter/2), (backgroundX+backgroundWidth)-(measleDiameter/2) );
  }
  if ( measleY < button1Y+buttonSide+(measleDiameter/2) ) {
    println("\t\tYhere", measleY, button1Y+buttonSide);
    measleY = random( button1Y+buttonSide+(measleDiameter/2), (backgroundY+backgroundHeight)-(measleDiameter/2) );
  }
  //+buttonSide
  //+buttonSide
  //if () {}
  noStroke();
  if ( measlesON==true )  ellipse( measleX, measleY, measleDiameter, measleDiameter );
  stroke(1); //default is 1
  fill(resetColour);
} //End draw
//
void keyPressed() {
  if ( key==' ' ) measlesON=true; //START, SPACE-Bar
  if ( keyCode==BACKSPACE ) measlesON=false; //STOP //Not Needed key==CODED &&
  if ( keyCode==ESC ) exit(); //QUIT //key==CODED &&
} //End keyPressed
//
void mousePressed() {
  if ( mouseX>button1X && mouseX<button1X+buttonSide && mouseY>button1Y && mouseY<button1Y+buttonSide ) measlesON=true; //START
  if ( mouseX>button2X && mouseX<button2X+buttonSide && mouseY>button2Y && mouseY<button2Y+buttonSide ) measlesON=false; //STOP
  if ( mouseX>button3X && mouseX<button3X+buttonSide && mouseY>button3Y && mouseY<button3Y+buttonSide ) exit(); //QUIT
} //End mousePressed
//
//End MAIN Program
