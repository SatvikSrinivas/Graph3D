
class Vector3D {

  float x, y, z;

  public Vector3D (float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }

  public Vector3D add (Vector3D v) {
    return new Vector3D(x + v.x, y + v.y, z + v.z);
  }

  public Vector3D cross (Vector3D v) {
    return new Vector3D(y * v.z - z * v.y, v.x * z - x * v.z, x * v.y - y * v.x);
  }

  public void increment(Vector3D v) {
    x += v.x;
    y += v.y;
    z += v.z;
  }

  public void rotateX (float angle) {
    Vector2D v = new Vector2D(y, z);
    v.rotate(angle);
    y = v.x;
    z = v.y;
  }

  public void rotateY (float angle) {
    Vector2D v = new Vector2D(z, x);
    v.rotate(angle);
    z = v.x;
    x = v.y;
  }

  public void rotateZ (float angle) {
    Vector2D v = new Vector2D(x, y);
    v.rotate(angle);
    x = v.x;
    y = v.y;
  }

  public Vector3D getScaled (float f) {
    return new Vector3D(f*x, f*y, f*z);
  }

  public float magnitude() {
    return sqrt(x * x + y * y + z * z);
  }

  public Vector3D unit() {
    return getScaled(1/magnitude());
  }

  public Vector2D get2D() {
    Vector3D v1 = i.getScaled(x);
    Vector3D v2 = j.getScaled(y);
    Vector3D v3 = k.getScaled(z);
    Vector3D v = v1.add(v2).add(v3);
    return new Vector2D(v.x, v.y);
  }

  public Vector2D get2D_orthogonalProjection() {
    return new Vector2D (x, y);
  }

  public void plot() {
    point3D(x, y, z);
  }

  public void plot_shiftBy(Vector3D shift) {
    point3D(x + shift.x, y + shift.y, z + shift.z);
  }

  public void plot(color c, float r) {
    point3D(x, y, z, r, c);
  }

  public void draw(color c) {
    draw(new Vector3D(0, 0, 0), c);
  }

  public void draw(Vector3D init, color c) {
    STROKE_COLOR = c;
    line3D(init.x, init.y, init.z, init.x + x, init.y + y, init.z + z, c);
  }

  public void draw(Vector3D init, color c, float size) {
    line3D(init.x, init.y, init.z, init.x + x, init.y + y, init.z + z, c, size);
  }

  public Vector3D copy() {
    return new Vector3D(x, y, z);
  }

  public String toString() {
    return "<"+x+", "+y+", "+z+">";
  }
}
