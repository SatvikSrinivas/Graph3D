
int dim_3D = 50;

void setup() {
  fullScreen(P2D);
  setBounds(-dim_3D, dim_3D, -dim_3D, dim_3D, -dim_3D, dim_3D);
  angleOfRotation = (float)(PI/16);
  rotateX(-PI/2);
  rotateY(-3 * PI/4);
  //TriangleTester3D_setup();
}

void draw() {
  draw3D_before();
  graph3D();
  draw3D_after();
}

void draw3D_before() {
  instantiateDepthMatrix();
  meshMatrix = new boolean[displayWidth][displayHeight];
  customBackground(purple);
  axes();
}

void draw3D_after() {
  frame();
  displayMouseCoordinates();
  showZoom_Debug();
}

void test() {
  //sphere3D();
  //sphere3D(20);
  //quadrilateral3D(10, 10, 20, 5, 15, 20, -10, 15, 5, 0, 10, 10);
  //quadrilateral2D_Tester();
  cone3D(100);
}

void sphere3D() {
  setPointRadius(2);
  float z;
  for (float x = X_MIN; x <= X_MAX; x += 0.1)
    for (float y = Y_MIN; y <= Y_MAX; y += 0.1) {
      z = sqrt(dim_3D * dim_3D - x * x - y * y);
      //if ( z < 0.01 * Z_MAX)
      //  setPointRadius(2);
      //else
      //  setPointRadius(5);
      setFillColor(getScaled(yellow, linearMap(z, Z_MIN, Z_MAX, 0, 0.8)));
      point3D(x, y, z);
      point3D(x, y, -z);
    }
}

float sphere3D_zMax = 10;
color[] colors = new color[] {color(255, 0, 127), color(255, 0, 220), color(255)};
void sphere3D(int n) {
  float r, r_next, theta = 0, thetaInc = (2 * PI) / n, z, zInc = (Z_MAX - Z_MIN) / n, P = dim_3D;
  color fillColor;
  int count = 0;
  //println(zInc);
  z = Z_MIN;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      r = sqrt(P * P - z * z);
      r_next = sqrt(P * P - ((z + zInc) * (z + zInc)));
      fillColor = colors[count++ % colors.length];
      setFillColor(fillColor);
      quadrilateral3D_fill(r * cos(theta), r * sin(theta), z, r * cos(theta + thetaInc), r * sin(theta + thetaInc), z,
        r_next * cos(theta), r_next * sin(theta), z + zInc, r_next * cos(theta + thetaInc), r_next * sin(theta + thetaInc), z + zInc);
      theta += thetaInc;
    }
    z += zInc;
  }
  noLoop();
}

void cylinder3D(int n) {
  float R = dim_3D/2, theta = 0, inc = (2 * PI) / n;
  for (int i = 0; i < n; i++) {
    triangle3D_fill(R * cos(theta), R * sin(theta), -R, R * cos(theta), R * sin(theta), R, R * cos(theta + inc), R * sin(theta + inc), R);
    triangle3D_fill(R * cos(theta + inc), R * sin(theta + inc), -R, R * cos(theta), R * sin(theta), -R, R * cos(theta + inc), R * sin(theta + inc), R);
    theta += inc;
  }
}

void cone3D(int n) {
  float R = dim_3D, theta = 0, inc = (2 * PI) / n;
  for (int i = 0; i < n; i++) {
    triangle3D_fill(0, 0, 0, R * cos(theta), R * sin(theta), dim_3D, R * cos(theta + inc), R * sin(theta + inc), dim_3D);
    theta += inc;
  }
}

void graph3D() {
  test();
  //parametricParaboloid();
  //parametricParaboloid_mesh();
}
