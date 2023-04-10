
void parametricParaboloid_mesh() {
  //mesh = true;
  float x, y, z, stretchFactor = 1.025;
  setPointRadius(1);
  for (float u = 0; u <= sqrt(X_MAX); u+=0.5)
    for (float v = 0; v <= sqrt(Y_MAX); v+=0.0001) {
      z = u + v;
      setFillColor(getScaled(red, linearMap(z, 0, 1.25 * Z_MAX, 0, 1)));
      x = stretchFactor * sqrt(u);
      y = stretchFactor * sqrt(v);
      point3D(x, y, z);
      point3D(-x, y, z);
      point3D(x, -y, z);
      point3D(-x, -y, z);
      x = sqrt(u) / stretchFactor;
      y = sqrt(v) / stretchFactor;
      point3D(x, y, z);
      point3D(-x, y, z);
      point3D(x, -y, z);
      point3D(-x, -y, z);
    }
  for (float v = 0; v <= sqrt(Y_MAX); v+=0.5)
    for (float u = 0; u <= sqrt(X_MAX); u+=0.0001) {
      x = stretchFactor * sqrt(u);
      y = stretchFactor * sqrt(v);
      z = u + v;
      setMeshColor(getScaled(red, linearMap(z, 0, 1.25 * Z_MAX, 0, 1)));
      point3D(x, y, z);
      point3D(-x, y, z);
      point3D(x, -y, z);
      point3D(-x, -y, z);
      x = sqrt(u) / stretchFactor;
      y = sqrt(v) / stretchFactor;
      point3D(x, y, z);
      point3D(-x, y, z);
      point3D(x, -y, z);
      point3D(-x, -y, z);
    }
  //mesh = false;
}

void parametricParaboloid() {
  float x, y, z, increment = 0.01, threshold = 0.1;
  setPointRadius(5);
  for (float u = 0; u <= sqrt(X_MAX); u+=increment)
    for (float v = 0; v <= sqrt(Y_MAX); v+=increment) {
      x = sqrt(u);
      y = sqrt(v);
      z = u + v;
      setFillColor(getScaled(cyan, linearMap(z, 0, 1 * Z_MAX, 0, 1)));
      point3D(x, y, z);
      point3D(-x, y, z);
      point3D(x, -y, z);
      point3D(-x, -y, z);
      if (abs(x) < threshold || abs(y) < threshold)
        increment = 0.001;
      else increment = 0.01;
    }
}
