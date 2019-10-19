int cols, rows;
int scale = 20;
int w = 1500;
int h = 900;

float flying = 0;

//using a 2d array to hold all z values
float[][] terrain;

void setup(){

  size(600,600,P3D);
  cols = w/scale;
  rows = h/scale;
  
  terrain = new float[cols][rows];
  
  lights();

}

void draw(){
  
  lights();
  
  //flying -= 0.003; //waves
  flying -= 0.1; //mountains
  
  //getting the random points and storing them in the 2d array
  float yOff = flying;
  for(int j = 0; j < rows; j++){
    float xOff = 0;
    for(int i = 0; i < cols; i++){
      terrain[i][j] = map(noise(xOff,yOff), 0,1,-100,100);
      //xOff += 0.08; //waves
      xOff += 0.2; //mountains
    }
    //yOff+=0.08; //waves
    yOff += 0.2; //mountains
  }
  
  background(129,150,171);
  //background(0,191,255);
  //noFill();
  fill(0,102,0); //mountains
  //fill(0, 119, 190); //waves
  //stroke(255);
  noStroke();
  
  //rotating from center of window
  translate(width/2,height/2);
  //rotating by 60 degrees on the x
  rotateX(PI/3);
  
  //moving back into a better position for viewing
  translate(-width,-height + 50, -50);
  
  for(int j = 0; j < rows-1; j++){
    //starting a triangle strip
    beginShape(TRIANGLE_STRIP);
    for(int i = 0; i < cols; i++){
      //creating top row of vertexs
      vertex(i*scale,j*scale, terrain[i][j]);
      //creating bottom vertex
      vertex(i*scale,(j+1)*scale,terrain[i][j+1]);
    }
    //ending a triangle strip at the end of the row
    endShape();
  }

}
