
void zEquals_ySquared(float x) {
  setFillColor(navy);
  setPointRadius(2);
  float z, k = SCALE;
  for (float y = -k; y <= k; y+=0.01) {
    z = 0.01 * x * x + y * y;
    point3D(x, y, z);
  }
}

void zEquals_xSquared(float y) {
  float z, k = SCALE;
  setFillColor(green);
  setPointRadius(2);
  for (float x = -k; x <= k; x+=0.01) {
    z = 0.01 * x * x + y * y;
    point3D(x, y, z);
  }
}

void parametricCuboid() {
  float x, y, z;
  setPointRadius(3);
  for (float u = -SCALE; u <= SCALE; u++)
    for (float v = -SCALE; v <= SCALE; v++) {
      x = pow(u, 0.333);
      y = pow(v, 0.333);
      z = 0.1 * (u + v);
      if (z < SCALE) {
        setFillColor(getScaled(red, linearMap(z, 0, SCALE, 0.5, 1)));
        point3D(x, y, z);
        point3D(-x, y, z);
        point3D(x, -y, z);
        point3D(-x, -y, z);
      }
    }
}

// f(x,y) = 0.1 * (x^2 + y^2)
void parametricParaboloid_tangentPlane(float x_0, float y_0) {
  int k = 10;
  setFillColor(cyan);
  setPointRadius(3);
  float a = 0.2 * x_0, b = 0.2 * y_0, c = -0.1 * (x_0 * x_0 + y_0 + y_0);
  for (float x = x_0 - k; x <= x_0 + k; x++)
    for (float y = y_0 - k; y <= y_0 + k; y++)
      point3D(x, y, a * x + b * y + c);
}

void cone() {
  setPointRadius(2);
  for (int z = 0; z <= SCALE; z += 5) {
    setFillColor(getScaled(blue, linearMap(z, 0, SCALE, 0.25, 1)));
    circle3D_xyPlane(0, 0, z, z);
  }
}

void paraboloid() {
  int k = 300;
  setPointRadius(2);
  float z;
  for (int x = -k; x < k; x++)
    for (int y = -k; y < k; y++) {
      z = 0.01 * x * x + y * y;
      if (z <= SCALE) {
        setFillColor(getScaled(red, linearMap(z, 0, SCALE, 0.25, 1)));
        point3D(x, y, z);
      }
    }
}

void circle3D_xyPlane(float x, float y, float z, float r) {
  for (float theta = 0; theta < TAU; theta += 0.01)
    point3D(x + r*cos(theta), y + r*sin(theta), z);
}

void circle2D(int n) {
  float R = SCALE, theta = 0, inc = (2 * PI) / n;
  for (int i = 0; i < n; i++) {
    triangle2D(0, 0, R * cos(theta), R * sin(theta), R * cos(theta + inc), R * sin(theta + inc));
    theta += inc;
  }
}

void plane(Vector3D init, Vector3D normal, color col) {
  float k = 100;
  float x_0 = init.x, y_0 = init.y, z_0 = init.z, a = normal.x, b = normal.y, c = normal.z, d = a*x_0 + b*y_0 + c*z_0;
  if (a == 0 && b == 0 && c == 0) {
    println("ERROR --> ATTEMPT TO RENDER PLANE WITH NORMAL <0, 0, 0> FAILED!");
    return;
  }
  if (c == 0) {
    for (float y = y_0 - k; y <= y_0 + k; y++)
      for (float z = z_0 - k; z <= z_0 + k; z++)
        point3D((d - b * y) / a, y, z, 2.5, col);
  } else if (b == 0) {
    for (float x = x_0 - k; x <= x_0 + k; x++)
      for (float y = y_0 - k; y <= y_0 + k; y++)
        point3D(x, y, (d - a * x) / c, 2.5, col);
  } else {
    for (float x = x_0 - k; x <= x_0 + k; x++)
      for (float y = y_0 - k; y <= y_0 + k; y++)
        point3D(x, y, (d - a * x - b * y) / c, 2.5, col);
  }
}

void plane_Reimamn(Vector3D init, float z, color col) {
  float r = 1;
  for (float x = init.x - r; x <= init.x + r; x++)
    for (float y = init.y - r; y <= init.y + r; y++)
      point3D(x, y, z, 2.5, col);
}

void reimann_Paraboloid() {
  float k = 200, z;
  for (float x = -k; x <= k; x++)
    for (float y = -k; y <= k; y ++) {
      //z = 0.05 * x * x * y * y;
      z = 3 * x + 4 * y + 9;
      //if (z <= 500)
      plane_Reimamn(new Vector3D(x, y, z), z, navy);
    }
}

void coolAnimation() {
  float y, m = 0.1 * mouseY();
  for (float x = -500; x <= 500; x+= 0.05) {
    y = 0.001 * x * x + m * sin(1/m * x);
    point2D(x, y, 2, color((int)abs(mouseX()), (int)abs(mouseY()), 0));
    point2D(x, -y, 2, color((int)abs(mouseX()), (int)abs(mouseY()), 0));
  }
}

void plane() {
  int k = 500;
  for (int x = -k; x < k; x+=2)
    for (int y = -k; y < k; y+=2)
      point3D(x, y, 0, 3, color(0, 0, 127));
}
