
void zoom(boolean in) {
  if (in) {
    if (zoomFactor >= 10)
      return;
    zoomFactor++;
    SCALE += zoomFactor * 10;
  } else {
    if (zoomFactor <= 1)
      return;
    zoomFactor--;
    SCALE -= zoomFactor * 10;
  }
}

int debug_zoomFactor = 90, zoomDim = 11, half_zoomDim = zoomDim/2;
boolean showZoom_Debug = false;
void showZoom_Debug() {
  if (!showZoom_Debug) {
    x_shift = 0;
    return;
  }
  x_shift = 500;
  strokeWeight(2.5);
  stroke(0);
  int x_0 = 40, x = x_0, y_0 = 40, y = y_0;

  for (int i = mouseX - half_zoomDim; i <= mouseX + half_zoomDim; i++) {
    for (int j = mouseY - half_zoomDim; j <= mouseY + half_zoomDim; j++) {
      fill(get(i, j));
      square(y, x, debug_zoomFactor);
      x += debug_zoomFactor;
    }
    x = x_0;
    y += debug_zoomFactor;
  }

  strokeWeight(10);
  stroke(magenta);
  noFill();
  square(y_0 + 5 * debug_zoomFactor, x_0 + 5 * debug_zoomFactor, debug_zoomFactor);
}
