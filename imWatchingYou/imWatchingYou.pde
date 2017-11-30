import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

eyeBall leftEye;
eyeBall rightEye;

int lastX, lastY;
int frames;

void setup() {
  
  size(640, 380);
  
  leftEye   = new eyeBall(width/2+120,height/2,200);
  rightEye  = new eyeBall(width/2-120,height/2,200);
  video     = new Capture(this, 640/2, 480/2);
  
  opencv    = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  video.start();

}

void draw() {
  
  opencv.loadImage(video);
  
  Rectangle[] faces = opencv.detect();
  
  background(0);
   
  if(faces.length==0){
    
    leftEye.show(lastX,lastY);
    rightEye.show(lastX,lastY);
  
  }
  
  if (faces.length > 0) {
    
    lastX=faces[0].x;
    lastY=faces[0].y;
    
    leftEye.show(faces[0].x,faces[0].y);
    rightEye.show(faces[0].x,faces[0].y);
  
  }
  
  fill(0);
  triangle(0,80,width/2,height/2+20,width,80);

}

void captureEvent(Capture c) {
  
  c.read();

}