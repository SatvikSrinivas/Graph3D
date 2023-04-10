
class Vector2D {

  float x, y;

  public Vector2D(float x, float y) {
    initialize_Vector2D(x, y);
  }

  public void initialize_Vector2D(float x, float y) {
    this.x = x;
    this.y = y;
  }

  public void add(Vector2D v) {
    this.x += v.x;
    this.y += v.y;
  }

  public void draw(color c) {
    stroke(c);
    draw(new Vector2D(0, 0), c);
  }

  public void draw(Vector2D init, color c) {
    if (useHomemadeFunctions)
      line2D(init.x, init.y, init.x + x, init.y + y, c);
    else {
      stroke(c);
      line(getX(init.x), getY(init.y), getX(init.x + x), getY(init.y + y));
    }
  }

  public void plot(color c, float size) {
    point(x, y, c, size);
  }

  public void plot(color c) {
    plot(c, 25);
  }

  public Vector2D getScaled (float f) {
    return new Vector2D (f * x, f * y);
  }

  public float dot(Vector2D v) {
    return x * v.x + y * v.y;
  }

  public float magnitude() {
    return sqrt(x * x + y * y);
  }

  public float angle() {
    float mag = magnitude();
    if (mag == 0) {
      println("ERROR: angle() called on zero vector returns 0");
      return 0;
    }
    if (y < 0)
      return TAU - acos(dot(new Vector2D(1, 0))/mag);
    return acos(dot(new Vector2D(1, 0))/mag);
  }

  public void rotate(float theta) {
    float c = cos(theta), s = sin(theta);
    initialize_Vector2D(c * x - s * y, s * x + c * y);
  }

  public String toString() {
    return "<"+x+", "+y+">";
  }
}
