/*
The idea behind this is to simulate a simple video mapping implementation while utilizing a midi
controller to switch between pre-loaded videos. by pressing the 1,2,3,4 -- 5,6,7,8 -- q,w,e,r
keys it will allow you to place the verticies of a quadrolateral at the location of the mouse
within a sketch window, which allows you to map a video if you are projecting at odd angles.
If you have a midi controller you can assign the sliders and buttons to RGBA values associated
with each frame of each different video. I am aware that this is not the most efficient way
of doing this, however it does prove the concept that it could be done quickly and more
precisely in Processing. 
*/

import processing.video.*;
import themidibus.*;

//create a bus for MIDI controller handler
MidiBus bus;

//create a path for video files
Movie video6;
Movie video5;
Movie video4;
Movie video3;
Movie video2;
Movie video;

//create images to draw each frame of a video to
PImage img;
PImage img2;
PImage img3;

//initialize alpha channels for each PImage
int alpha1 = 255;
int alpha2 = 255;
int alpha3 = 255;

//create variables for where each vertex is drawn to display each image on
//should be transferred into an object
int v1x;
int v1y;
int v2x;
int v2y;
int v3x;
int v3y;
int v4x;
int v4y;
int v5x;
int v5y;
int v6x;
int v6y;
int v7x;
int v7y;
int v8x;
int v8y;
int vqx;
int vqy;
int vwx;
int vwy;
int vex;
int vey;
int vrx;
int vry;

//initiaize variables that hold RGB values for each PImage
int red1 = 255, green1 = 255, blue1 = 255, red2 = 255, green2 = 255, blue2 = 255, red3 = 255, green3 = 255, blue3 = 255;

//Run the program setup function
void setup(){
 fullScreen(P2D, 1);
 frameRate(23.976);
 
 //initialize values for corner-pins based on sketch dimensions (draws to quadrands 1, 2, and 3)
 v1x = 0;
 v1y = 0;
 v2x = width / 2;
 v2y = 0;
 v3x = 0;
 v3y = height / 2;
 v4x = width / 2;
 v4y = height / 2;
 v5x = width / 2;
 v5y = 0;
 v6x = width;
 v6y = 0;
 v7x = width / 2;
 v7y = height / 2;
 v8x = width;
 v8y = height / 2;
 vqx = 0;
 vqy = height / 2;
 vwx = width / 2;
 vwy = height / 2;
 vex = 0;
 vey = height;
 vrx = width / 2;
 vry = height;
 
 //patch MIDI with arguments for the input and output (-1 initializes no output)
 bus = new MidiBus(this, 0, -1);
 
 //direct a path for each video file you want to display
 video = new Movie(this, "FB6A9181.mov");
 video2 = new Movie(this, "FB6A1901.mov");
 video3 = new Movie(this, "Screen Tunnel_1_1.mov");
 video4 = new Movie(this, "SmokeCylinder.mov");
 video5 = new Movie(this, "Tunnel of footage 4.mov");
 video6 = new Movie(this, "1080p 23.976.mov");
}

//Video handler that loads each frame into it's respective PImage
void movieEvent(Movie v){
  
  if(video.available()){
   if(v == video){
   video.read();
   img = video;
   }
  }
  if(video2.available()){
   if(v == video2){
    video2.read();
    img2 = video2; 
   }
  }
  if(video3.available()){
   if(v == video3){
   video3.read(); 
   img = video3;
   }
  }
  if(video4.available()){
   if(v == video4){
   video4.read();
   img2 = video4;
   }
  }
  if(video5.available()){
    if(v == video5){
   video5.read();
   img3 = video5;
   }
  }
  if(video6.available()){
   if(v == video6){
   video6.read();
   img3 = video6;
   }
  }
}


//Runs the refresh function
void draw(){
  background(0);
  noStroke();
  
  //applies the RGBA values to the shape we are drawing the PImage into
  tint(red1, green1, blue1, alpha1);
  beginShape();
  //add a PImage to our shape
  texture(img);
  
  //the quadrolateral for video block 1
  vertex(v1x, v1y, 0, 0);
  vertex(v2x, v2y, 1920, 0);
  vertex(v4x, v4y, 1920, 1080);
  vertex(v3x, v3y, 0, 1080);
  

  endShape();
  
  noStroke();
  tint(red2, green2, blue2, alpha2);
  beginShape();
  texture(img2);
  
  vertex(v5x, v5y, 0, 0);
  vertex(v6x, v6y, 1920, 0);
  vertex(v8x, v8y, 1920, 1080);
  vertex(v7x, v7y, 0, 1080);
  
  endShape();
  
  noStroke();
  tint(red3, green3, blue3, alpha3);
  beginShape();
  texture(img3);
  
  vertex(vqx, vqy, 0, 0);
  vertex(vwx, vwy, 1920, 0);
  vertex(vrx, vry, 1920, 1080);
  vertex(vex, vey, 0, 1080);
  
  endShape();
}

//input handler for the keyboard, sets the mouse coordinates to the values of the verticies
void keyPressed(){
 if(key == '1'){
  v1x = mouseX;
  v1y = mouseY;
 }
 if(key == '2'){
  v2x = mouseX;
  v2y = mouseY;
 }
 if(key == '3'){
  v3x = mouseX;
  v3y = mouseY;
 }
 if(key == '4'){
  v4x = mouseX;
  v4y = mouseY;
 }
 if(key == '5'){
  v5x = mouseX;
  v5y = mouseY;
 }
 if(key == '6'){
  v6x = mouseX;
  v6y = mouseY;
 }
 if(key == '7'){
  v7x = mouseX;
  v7y = mouseY;
 }
 if(key == '8'){
  v8x = mouseX;
  v8y = mouseY;
 }
 if(key == 'q'){
  vqx = mouseX;
  vqy = mouseY;
 }
 if(key == 'w'){
  vwx = mouseX;
  vwy = mouseY;
 }
 if(key == 'e'){
  vex = mouseX;
  vey = mouseY;
 }
 if(key == 'r'){
  vrx = mouseX;
  vry = mouseY;
 }
 }

//midi controller handler, refreshes every time a change occurs in the midi controller sliders
void controllerChange(int channel, int number, int value){
 if(number == 48){
   alpha1 = value * 2;
 }
 if(number == 49){
  alpha2 = value * 2; 
 }
 if(number == 50){
  red1 = value * 2;
 }
 if(number == 51){
  green1 = value * 2;
 }
 if(number == 52){
  blue1 = value * 2;
 }
 if(number == 53){
  red2 = value * 2; 
 }
 if(number == 54){
  green2 = value * 2;
 }
 if(number == 55){
  blue2 = value * 2; 
 }
 if(number == 56){
  alpha3 = value * 2; 
 }
}

//Midi controller event handler for the buttons(applied to notes)
void noteOn(Note note){
  
  if(note.pitch() == 56){
   video3.stop();
   video.play(); 
  }
  if(note.pitch() == 57){
   video4.stop();
   video2.play(); 
  }
  if(note.pitch() == 48){
   video.stop();
   video3.play();
  }
  if(note.pitch() == 49){
   video2.stop();
   video4.play();
  }
  if(note.pitch() == 58){
   video6.stop();
   video5.play();
  }
  if(note.pitch() == 50){
   video5.stop();
   video6.play();
  }
}