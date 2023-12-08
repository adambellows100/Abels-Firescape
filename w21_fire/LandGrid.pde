class LandGrid{
  int numTracts;
  int tractLength;
  Land[][] grid;
  
  LandGrid(int tracts, int _length){
    numTracts = tracts;
    tractLength = _length;
    grid = new Land[numTracts][tractLength];
  }
  
  void setupLand(float density) {
    int disp = width/grid.length;
    for(int i = 0; i<grid.length; i++){
      for(int j = 0; j<grid[i].length; j++){
        if(j==0){
          grid[i][j] = new Land(disp * j, disp*i, disp, Land.FIRE);
        }
        else if(random(100)<=grassDensity){
          grid[i][j] = new Land(disp * j, disp*i, disp, Land.GRASS);
        }
        else{
          grid[i][j] = new Land(disp * j, disp*i, disp, Land.DIRT);
        }
      }
    }
  }//setupLand
  
  void showLand() {
    for(int i = 0; i<grid.length; i++){
      for(int j = 0; j<grid[i].length; j++){
        grid[i][j].display();
      }
    }
  }//showLand
  
  
  void burn() {
    for(int i = 0; i<grid.length; i++){
      for(int j = 1; j<grid[i].length; j++){
        grid[i][j].updateNextState(findFire(i,j));
      }
    }
    for(int i = 0; i<grid.length; i++){
      for(int j = 0; j<grid[i].length; j++){
        grid[i][j].changeState();
      }
    }
  }//liveFire
  
  int findFire(int row, int column){
    if (row >=1 && 
        grid[row-1][column].state == Land.FIRE){
          return Land.FIRE;
    }
    if (row < grid.length-1 &&
      grid[row+1][column].state == Land.FIRE){
        return Land.FIRE;
    }
    if (column >= 1 &&
      grid[row][column-1].state == Land.FIRE){
        return Land.FIRE;
    }
    if (column < grid[row].length -1 &&
      grid[row][column+1].state == Land.FIRE){
        return Land.FIRE;
    }
    return Land.DIRT;
  }
}
