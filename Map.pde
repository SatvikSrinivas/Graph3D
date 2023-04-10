
// linearly maps x in range [a, b] to range [c, d]
float linearMap (float x, float a, float b, float c, float d) {
  return (x - a) * (d - c) / (b - a) + c;
}

float mouseY(float c, float d) {
  return linearMap(mouseY(), -displayHeight/2, displayHeight/2, c, d);
}

float mapX(float x) {
  return linearMap(x, X_MIN, X_MAX, -SCALE, SCALE);
}

float mapY(float y) {
  return linearMap(y, Y_MIN, Y_MAX, -SCALE, SCALE);
}

float mapZ(float z) {
  return linearMap(z, Z_MIN, Z_MAX, -SCALE, SCALE);
}

float getRandom(float a, float b) {
  return linearMap((float)Math.random(), 0, 1, a, b);
}
