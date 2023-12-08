//Driver variables
boolean burning = false;
int grassDensity = 99;

LandGrid grid;

void setup() {
  size(800, 800);
  frameRate(10);
  grid = new LandGrid(200,200);
  grid.setupLand(grassDensity);
  grid.showLand();
}//setup

void draw() {
  grid.showLand();
  if (burning) {
    grid.burn();
  }//burning
}//draw

void keyPressed() {
  if (key == ' ') {
    burning = !burning;
  }//start burning
  else if (key == 'r') {
    burning = false;
    grid.setupLand(grassDensity);
  }
}//keyPressed
