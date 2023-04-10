
boolean useHomemadeFunctions = true;
int x_shift = 0, y_shift = 0;
float angleOfRotation;

void point2D(float x, float y, float r, color c) {
  x = getX(x + x_shift);
  y = getY(y + y_shift);
  int a, b;
  for (float i = x - r; i <= x + r; i++)
    for (float j = y - r; j <= y + r; j++)
      if (dist(x, y, i, j) < r) {
        a = (int)i;
        b = (int)j;
        if (a >= 0 && b >= 0 && a < displayWidth && b < displayHeight && DEPTH >= depth[a][b]) {
          set(a, b, c);
          depth[a][b] = DEPTH;
        }
      }
}

void point2D(float x, float y, color c) {
  x = getX(x + x_shift);
  y = getY(y + y_shift);
  int a, b;
  for (float i = x - STROKE_WEIGHT; i <= x + STROKE_WEIGHT; i++)
    for (float j = y - STROKE_WEIGHT; j <= y + STROKE_WEIGHT; j++)
      if (dist(x, y, i, j) < STROKE_WEIGHT) {
        a = (int)i;
        b = (int)j;
        if (a >= 0 && b >= 0 && a < displayWidth && b < displayHeight && DEPTH >= depth[a][b]) {
          set(a, b, c);
          depth[a][b] = DEPTH;
        }
      }
}

void point2D(float x, float y) {
  x = getX(x + x_shift);
  y = getY(y + y_shift);
  int a, b;
  for (float i = x - POINT_RADIUS; i <= x + POINT_RADIUS; i++)
    for (float j = y - POINT_RADIUS; j <= y + POINT_RADIUS; j++)
      if (dist(x, y, i, j) < POINT_RADIUS) {
        a = (int)i;
        b = (int)j;
        if (a >= 0 && b >= 0 && a < displayWidth && b < displayHeight && (mesh || DEPTH >= depth[a][b])) {
          if (mesh && !meshMatrix[a][b]) {
            set(a, b, MESH_COLOR);
            meshMatrix[a][b] = true;
          } else {
            //set(a, b, FILL_COLOR);
            set(a, b, getScaled(FILL_COLOR, linearMap(DEPTH, 0, 100, 0.5, 1)));
          }
          depth[a][b] = DEPTH;
          MIN_DEPTH = min(MIN_DEPTH, DEPTH);
          MAX_DEPTH = max(MAX_DEPTH, DEPTH);
        }
      }
}

void point3D(float x, float y, float z, float r, color c) {
  x = mapX(x);
  y = mapY(y);
  z = mapZ(z);
  Vector3D v1 = i.getScaled(x);
  Vector3D v2 = j.getScaled(y);
  Vector3D v3 = k.getScaled(z);
  Vector3D v = v1.add(v2).add(v3);
  setDepth(v.z);
  new Vector2D(v.x, v.y).plot(c, r);
}

void point3D(float x, float y, float z) {
  x = mapX(x);
  y = mapY(y);
  z = mapZ(z);
  Vector3D v1 = i.getScaled(x);
  Vector3D v2 = j.getScaled(y);
  Vector3D v3 = k.getScaled(z);
  Vector3D v = v1.add(v2).add(v3);
  setDepth(v.z);
  new Vector2D(v.x, v.y).plot(FILL_COLOR, STROKE_WEIGHT);
}

final int line_numPoints = 1000;
void line2D(float x1, float y1, float x2, float y2, color c) {
  Vector2D curr = new Vector2D(x1, y1), add = new Vector2D(x2 - x1, y2 - y1).getScaled(1.0 / line_numPoints);
  for (int i = 0; i < line_numPoints; i++) {
    curr.plot(c, STROKE_WEIGHT);
    curr.add(add);
  }
}

void line2D(float x1, float y1, float x2, float y2) {
  STROKE = true;
  Vector2D curr = new Vector2D(x1, y1), add = new Vector2D(x2 - x1, y2 - y1).getScaled(1.0 / line_numPoints);
  for (int i = 0; i < line_numPoints; i++) {
    curr.plot(STROKE_COLOR, STROKE_WEIGHT);
    curr.add(add);
  }
  STROKE = false;
}

void line2D(Vector2D v1, Vector2D v2) {
  line2D(v1.x, v1.y, v2.x, v2.y);
}

void line3D(float x1, float y1, float z1, float x2, float y2, float z2, color c) {
  STROKE = true;
  Vector3D curr = new Vector3D(x1, y1, z1), inc = new Vector3D(x2 - x1, y2 - y1, z2 - z1).getScaled(1.0 / line_numPoints);
  for (int i = 0; i < line_numPoints; i++) {
    curr.plot(c, 2.5);
    curr.increment(inc);
  }
  STROKE = false;
}

void line3D(float x1, float y1, float z1, float x2, float y2, float z2, color c, float size) {
  Vector3D curr = new Vector3D(x1, y1, z1), inc = new Vector3D(x2 - x1, y2 - y1, z2 - z1).getScaled(1.0 / line_numPoints);
  for (int i = 0; i < line_numPoints; i++) {
    curr.plot(c, size);
    curr.increment(inc);
  }
}

void line3D(float x1, float y1, float z1, float x2, float y2, float z2) {
  STROKE = true;
  Vector3D curr = new Vector3D(x1, y1, z1), inc = new Vector3D(x2 - x1, y2 - y1, z2 - z1).getScaled(1.0 / line_numPoints);
  for (int i = 0; i < line_numPoints; i++) {
    curr.plot(STROKE_COLOR, 2.5);
    curr.increment(inc);
  }
  STROKE = false;
}

float getX (float x) {
  return x + displayWidth/2.0;
}

float getY (float y) {
  return -y + displayHeight/2.0;
}

void point(float x, float y, color c, float pointRadius) {
  if (useHomemadeFunctions) {
    if (rubiks)
      point2D(x, y, pointRadius, c);
    else if (STROKE)
      point2D(x, y, STROKE_COLOR);
    else
      point2D(x, y);
  } else {
    fill(c);
    circle(getX(x), getY(y), pointRadius);
  }
}
