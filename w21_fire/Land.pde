class Land {

  int size;
  int state;
  int nextState;
  int x;
  int y;

  //State variable constants
  public static final int  DIRT = 2;
  public static final int FIRE = 1;
  public static final int BURNT = 0;
  public static final int GRASS = 3;

  //Helpful color values
  color DIRT_COLOR = #81582F;
  color FIRE_COLOR = #F20C0C;
  color BURNT_COLOR = #810707;
  color GRASS_COLOR = #49B90D;
  Land(int _x, int _y, int sz, int st) {
    x = _x;
    y = _y;
    size = sz;
    state = st;
  }//constructor

  void display() {
    if (state == DIRT) {
      fill(DIRT_COLOR);
    }
    else if (state == FIRE) {
      fill(FIRE_COLOR);
    }
    else if (state == BURNT) {
      fill(BURNT_COLOR);
    }
    else if (state == GRASS) {
      fill(GRASS_COLOR);
    }
    square(x, y, size);
  }//display

  void updateNextState(int neighborState) {
    if (state == FIRE) {
      nextState = BURNT;
    }
    else if (state == GRASS && neighborState  == FIRE) {
      nextState = FIRE;
    }
    else {
      nextState = state;
    }
  }//updateState

  void changeState() {
    state = nextState;
  }//changeState

}//Land class
