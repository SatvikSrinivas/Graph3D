
class TriangleObject3D {
  float x1, y1, z1, x2, y2, z2, x3, y3, z3;
  public TriangleObject3D(float range) {
    x1 = getRandom(-range, range);
    y1 = getRandom(-range, range);
    z1 = getRandom(-range, range);
    x2 = getRandom(-range, range);
    y2 = getRandom(-range, range);
    z2 = getRandom(-range, range);
    x3 = getRandom(-range, range);
    y3 = getRandom(-range, range);
    z3 = getRandom(-range, range);
  }
  public TriangleObject3D(float a, float b, float c, float d, float e, float f, float g, float h, float i) {
    x1 = a;
    y1 = b;
    z1 = c;
    x2 = d;
    y2 = e;
    z2 = f;
    x3 = g;
    y3 = h;
    z3 = i;
  }
  public void draw(color c) {
    //setFillColor(cyan);
    //parallelogram(x1, y1, z1, x2, y2, z2, x3, y3, z3);
    setFillColor(getScaled(c, 0.85));
    //float yShift = 0.001 * dim_3D;
    //setStrokeWeight(1);
    //setStrokeColor(magenta);
    //triangle3D_border(x1, y1 + yShift, z1, x2, y2 + yShift, z2, x3, y3 + yShift, z3);
    triangle3D_fill(x1, y1, z1, x2, y2, z2, x3, y3, z3);
    //setStrokeWeight(2.85);
    //setStrokeWeight(1);
    //setStrokeColor(magenta);
    //triangle3D_border(x1, y1 - yShift, z1, x2, y2 - yShift, z2, x3, y3 - yShift, z3);
    //setPointRadius(20);
    //setFillColor(red);
    //point3D(x1, y1, z1);
    //setFillColor(green);
    //point3D(x2, y2, z2);
    //setFillColor(blue);
    //point3D(x3, y3, z3);
  }
}

void TriangleTester3D_setup() {
  one = new TriangleObject3D(dim_3D/2, dim_3D/2, 0, -dim_3D/2, dim_3D/2, 0, 0, dim_3D/2, dim_3D/2);
  two = new TriangleObject3D(dim_3D/2, -dim_3D/2, 0, -dim_3D/2, -dim_3D/2, 0, 0, -dim_3D/2, dim_3D/2);
}

TriangleObject3D one, two;
void triangleTester3D() {
  //one.draw(yellow);
  //two.draw(navy);
  triangleTesselation();
}

void triangleTesselation() {
  float z = 1;
  for (int i = -dim_3D; i < dim_3D; i++)
    for (int j = -dim_3D; j < dim_3D; j++) {
      new TriangleObject3D(i, 0, j, i + 1, 0, j, i+1.0/2, 0, j + z).draw(magenta);
      new TriangleObject3D(i + 0.5, 0, j + z, i + 1.5, 0, j + z, i + 1, 0, j).draw(yellow);
    }
}

float[] get2D (float x, float y, float z) {
  Vector3D v1 = i.getScaled(x);
  Vector3D v2 = j.getScaled(y);
  Vector3D v3 = k.getScaled(z);
  Vector3D v = v1.add(v2).add(v3);
  return new float[] {mapX(v.x), mapY(v.y)};
}

void triangle3D_border(float x1, float y1, float z1, float x2, float y2, float z2, float x3, float y3, float z3) {
  float[] a = get2D(x1, y1, z1), b = get2D(x2, y2, z2), c = get2D(x3, y3, z3);
  triangle2D(a[0], a[1], b[0], b[1], c[0], c[1]);
}

void triangle3D_fill(Vector3D A, Vector3D B, Vector3D C) {
  triangle3D_fill(A.x, A.y, A.z, B.x, B.y, B.z, C.x, C.y, C.z);
}

int triangle3D_fill_numSamples = 500;
void triangle3D_fill(float x1, float y1, float z1, float x2, float y2, float z2, float x3, float y3, float z3) {
  setPointRadius(2);
  Vector3D init = new Vector3D(x1, y1, z1), U = new Vector3D(x2-x1, y2-y1, z2-z1), V = new Vector3D(x3-x1, y3-y1, z3-z1),
    u = init.copy(), v, w, uIncrement = U.getScaled(1.0/triangle3D_fill_numSamples), vIncrement = V.getScaled(1.0/triangle3D_fill_numSamples);
  for (int i = 0; i < triangle3D_fill_numSamples; i++) {
    v = new Vector3D(0, 0, 0);
    for (int j = i; j < triangle3D_fill_numSamples; j++) {
      w = u.add(v);
      w.plot();
      v.increment(vIncrement);
    }
    u.increment(uIncrement);
  }
}

void parallelogram(float x1, float y1, float z1, float x2, float y2, float z2, float x3, float y3, float z3) {
  setPointRadius(1);
  Vector3D init = new Vector3D(x1, y1, z1), U = new Vector3D(x2-x1, y2-y1, z2-z1), V = new Vector3D(x3-x1, y3-y1, z3-z1),
    u = init.copy(), v, w, uIncrement = U.getScaled(1.0/triangle3D_fill_numSamples), vIncrement = V.getScaled(1.0/triangle3D_fill_numSamples);
  for (int i = 0; i < triangle3D_fill_numSamples; i++) {
    v = init.copy();
    for (int j = 0; j < triangle3D_fill_numSamples; j++) {
      w = u.add(v);
      w.plot();
      v.increment(vIncrement);
    }
    u.increment(uIncrement);
  }
}

boolean insideTriangle(float p_x, float p_y, float a_x, float a_y, float b_x, float b_y, float c_x, float c_y) {
  float w1 = (a_x*(c_y-a_y)+(p_y-a_y)*(c_x-a_x)-p_x*(c_y-a_y)) / (((b_y-a_y)*(c_x-a_x))-((b_x-a_x)*(c_y-a_y)));
  float w2 = (p_y-a_y-w1*(b_y-a_y))/(c_y-a_y);
  return w1 >= 0 && w2 >= 0 && w1 + w2 <= 1;
}

void triangle2D_fill(float x1, float y1, float x2, float y2, float x3, float y3) {
  // Calculate the bounding box of the triangle
  float minX = min(x1, min(x2, x3));
  float minY = min(y1, min(y2, y3));
  float maxX = max(x1, max(x2, x3));
  float maxY = max(y1, max(y2, y3));

  // Loop through all pixels in the bounding box
  setPointRadius(1);
  for (float x = minX; x <= maxX; x++)
    for (float y = minY; y <= maxY; y++)
      if (insideTriangle(x, y, x1, y1, x2, y2, x3, y3))
        point2D(x, y);
}

void triangle2D_fill(Vector2D A, Vector2D B, Vector2D C) {
  triangle2D_fill(A.x, A.y, B.x, B.y, C.x, C.y);
}


void triangle2D(float x1, float y1, float x2, float y2, float x3, float y3) {
  line2D(x1, y1, x2, y2);
  line2D(x2, y2, x3, y3);
  line2D(x1, y1, x3, y3);
}

float triangleArea2D(Vector2D A, Vector2D B, Vector2D C) {
  return 0.5 * abs(A.x * (B.y - C.y) + B.x * (C.y - A.y) + C.x * (A.y - B.y));
}

float triangleArea2D(float x1, float y1, float x2, float y2, float x3, float y3) {
  return 0.5 * abs(x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2));
}
