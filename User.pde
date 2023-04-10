
void keyPressed () {
  switch (key) {
  case 'a':
    showAxes = !showAxes;
    return;
  case 'd':
    displayDepthMatrix();
    return;
  case 'f':
    showFrame = !showFrame;
    return;
  case 'h':
    useHomemadeFunctions = !useHomemadeFunctions;
    return;
  case 'm':
    showMouseCoordinates = !showMouseCoordinates;
    return;
  case 'z':
    showZoom_Debug = !showZoom_Debug;
    return;
  }

  switch (keyCode) {
  case RIGHT:
    rotateY(angleOfRotation);
    return;
  case LEFT:
    rotateY(-angleOfRotation);
    return;
  case UP:
    rotateX(-angleOfRotation);
    return;
  case DOWN:
    rotateX(angleOfRotation);
    return;
  case '[' :
    rotateZ(angleOfRotation);
    return;
  case ']' :
    rotateZ(-angleOfRotation);
    return;
  case '=' :
    zoom(true);
    return;
  case '-' :
    zoom(false);
    return;
  }
}
