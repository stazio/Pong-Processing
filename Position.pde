class Position {

  public float x, y;

  public Position(float x, float y) { 
    this.x = x;
    this.y = y;
  }

  public Position(float x) {
    this(x, 0);
  }

  public Position() {
    this(0, 0);
  }
  
  public int getX() {return (int)this.x;}
  public int getY() {return (int)this.x;}
  
  /**
   Moves in the direcrtion specified by the distance
   **/
  void move(int direction, int distance) {
    if (direction % 2 == 0) // Vert or Horiz?
      this.y += (distance*(direction-1)); // dir - 1 to make it positive or negative
    else
      this.x += (distance*(direction-2)); // dir - 2 to make it positive or negative
  }

  boolean at(Position other) {
    return this.x == other.x && this.y == other.y;
  }

  Position clone() {
    return new Position(this.x, this.y);
  }
}

class Motion extends Position {
  public float dx, dy;
  public Motion(float x, float y, float dx, float dy) {
    super(x,y);
    this.dx = dx;
    this.dy = dy;
  }
  public Motion(float x, float dx, float dy) {
    super(x);
    this.dx = dx;
    this.dy = dy;
  }
  public Motion(float dx, float dy) {
    super();
    this.dx = dx;
    this.dy = dy;
  }
  public Motion() {
    super();
    this.dx = 0;
    this.dy = 0;
  }
  
  public void update(float delta) {
    this.x += delta * this.dx;
    this.y += delta * this.dy;
  }
  
}