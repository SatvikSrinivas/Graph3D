
Vector3D i = new Vector3D(1, 0, 0), j = new Vector3D(0, 1, 0), k = new Vector3D(0, 0, 1);

void rotateX(float angle) {
  i.rotateX(angle);
  j.rotateX(angle);
  k.rotateX(angle);
}

void rotateY(float angle) {
  i.rotateY(angle);
  j.rotateY(angle);
  k.rotateY(angle);
}

void rotateZ(float angle) {
  i.rotateZ(angle);
  j.rotateZ(angle);
  k.rotateZ(angle);
}

void setBounds(float x_min, float x_max, float y_min, float y_max, float z_min, float z_max) {
  X_MIN = x_min;
  X_MAX = x_max;
  Y_MIN = y_min;
  Y_MAX = y_max;
  Z_MIN = z_min;
  Z_MAX = z_max;
}

float SCALE = 300, X_MIN, X_MAX, Y_MIN, Y_MAX, Z_MIN, Z_MAX;
boolean showAxes = false;

void axes() {
  if (!showAxes)
    return;
  setStrokeWeight(2.0);
  setStrokeColor(magenta);
  line3D(0, 0, 0, X_MAX, 0, 0);
  setStrokeColor(cyan);
  line3D(0, 0, 0, 0, Y_MAX, 0);
  setStrokeColor(orange);
  line3D(0, 0, 0, 0, 0, Z_MAX);
}

boolean showFrame = false;
void frame() {
  if (!showFrame)
    return;
  setStrokeColor(black);
  setStrokeWeight(2.0);

  line3D(X_MAX, Y_MAX, Z_MIN, X_MAX, Y_MAX, Z_MAX);
  line3D(X_MAX, Y_MIN, Z_MIN, X_MAX, Y_MIN, Z_MAX);
  line3D(X_MIN, Y_MAX, Z_MIN, X_MIN, Y_MAX, Z_MAX);
  line3D(X_MIN, Y_MIN, Z_MIN, X_MIN, Y_MIN, Z_MAX);

  line3D(X_MIN, Y_MIN, Z_MIN, X_MAX, Y_MIN, Z_MIN);
  line3D(X_MIN, Y_MIN, Z_MAX, X_MAX, Y_MIN, Z_MAX);
  line3D(X_MIN, Y_MAX, Z_MIN, X_MAX, Y_MAX, Z_MIN);
  line3D(X_MIN, Y_MAX, Z_MAX, X_MAX, Y_MAX, Z_MAX);

  line3D(X_MIN, Y_MIN, Z_MIN, X_MIN, Y_MAX, Z_MIN);
  line3D(X_MIN, Y_MIN, Z_MAX, X_MIN, Y_MAX, Z_MAX);
  line3D(X_MAX, Y_MIN, Z_MIN, X_MAX, Y_MAX, Z_MIN);
  line3D(X_MAX, Y_MIN, Z_MAX, X_MAX, Y_MAX, Z_MAX);
}
