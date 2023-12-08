//Driver variables
boolean burning = false;
int grassDensity = 75;

LandGrid grid;

void setup() {
  size(600, 600);
  frameRate(10);
  grid = new LandGrid(20,20);
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
