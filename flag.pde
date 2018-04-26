int depth = 10;
PImage flag;
PImage flag_original;
int x;
int y;
void drawRects(int x, int y) {
  stroke(0, 0, 255, 127);
  fill(0, 0, 255, 127);
  rect(0, 0, 4*x, 4*y);
  stroke(255, 0, 0, 127);
  fill(255, 0, 0, 127);
  rect(4*x, 0, 4*x, y);
  stroke(255, 255, 255, 127);
  fill(255, 255, 255, 127);
  rect(4*x, y, 4*x, y);
  stroke(255, 0, 0, 127);
  fill(255, 0, 0, 127);
  rect(4*x, 2*y, 4*x, y);
  stroke(255, 255, 255, 127);
  fill(255, 255, 255, 127);
  rect(4*x, 3*y, 4*x, y);
  for (int i = 4; i < 8; i+= 2) {
    stroke(255, 0, 0, 127);
    fill(255, 0, 0, 127);
    rect(0, y * i, width, y);
    
    stroke(255, 255, 255, 127);
    fill(255, 255, 255, 127);
    rect(0, (i+1)* y, width, y);
  }
}
void drawflag() {
  x = width/8;
  y = height/8;
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) { 
      flag.copy(flag_original, 0, 0, width, height, i * x, j * y, x, y); //modifies the PImage object

    }
  }

}

void setup() {
  frameRate(1);
  size(1280, 674);
  flag_original = loadImage("us_flag.png");
  flag = loadImage("us_flag.png");
  drawflag();
  
  
}

void draw() {
  if (depth > 0) {
    
  image(flag, 0, 0); 
  drawflag();
  drawRects(width/8, height/8); //draws onto the window
  saveFrame("new_flag.png");
  depth--;
  flag_original = loadImage("new_flag.png");
  //flag = loadImage("new_flag.png");

  }
}