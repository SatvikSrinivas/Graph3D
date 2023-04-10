
public void mouseDragged() {
  float dx = mouseX - pmouseX;
  float dy = mouseY - pmouseY;
  rotateY((int)dx * 0.1 * angleOfRotation);
  rotateX((int)dy * 0.1 * angleOfRotation);
}

float zoomFactor = 1;
public void mouseWheel(MouseEvent event) {
  if (SCALE <= 100) {
    SCALE = 100.1;
    return;
  }
  if (SCALE >= 500) {
    SCALE = 499.9;
    return;
  }
  SCALE -= event.getCount() * 2;
}

float mouseX() {
  return mouseX - displayWidth/2.0;
}

float mouseY() {
  return displayHeight/2.0 - mouseY;
}

boolean showMouseCoordinates;
void displayMouseCoordinates() {
  if (!showMouseCoordinates)
    return;
  textSize(50);
  fill(white);
  if (showZoom_Debug) {
    String text = "Z-DEPTH ["+mouseX+"]["+mouseY+"] = "+depth[mouseX - x_shift][mouseY - y_shift];
    text(text, displayWidth - (1920 - 1000 + textWidth(text))/2, 0.1 * displayHeight);
  } else
    text("("+mouseX()+", "+mouseY()+")", mouseX, mouseY);
}
