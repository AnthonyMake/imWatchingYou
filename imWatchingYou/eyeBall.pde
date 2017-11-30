class eyeBall{
  int x,y,w,h;
  
  eyeBall(int xtemp,int ytemp, int wtemp ){
    x=xtemp;
    y=ytemp;
    w=wtemp;
  }
  
  void show(int xface, int yface){
    stroke(0);
    fill(#FBFF1A);
    ellipse(x,y,w,w);
    
    float xRetina=map(xface,277,0,x-w/4,x+w/4);
    float yRetina=map(yface,0,169,y-w/4,y+w/4);
    
    noStroke();
    fill(0);
    ellipse(xRetina,yRetina+15,0.3*w,0.3*w);
  }
}