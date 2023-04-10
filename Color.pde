
color black = color(0), white = color(255), red = color(255, 0, 0), green = color(0, 255, 0), blue = color(0, 0, 255),
  yellow = color(255, 255, 0), cyan = color(0, 255, 255), purple = color(93, 63, 211), magenta = color(255, 0, 255),
  orange = color (255, 165, 0), navy = color(0, 0, 127);

boolean FILL = false, STROKE = false;
float POINT_RADIUS = 1.0, STROKE_WEIGHT = 1.0;
color FILL_COLOR = white, STROKE_COLOR = black;

void setFillColor(color c) {
  FILL = true;
  FILL_COLOR = c;
}

void removeFill() {
  FILL = false;
}

void setStrokeColor(color c) {
  STROKE_COLOR = c;
}

void setStrokeWeight(float s) {
  STROKE_WEIGHT = s;
}

void setPointRadius(float r) {
  POINT_RADIUS = r;
}

color getScaled(color c, float f) {
  return color(f * red(c), f * green(c), f * blue(c));
}

void customBackground(color c) {
  for (int i = 0; i < depth.length; i++)
    for (int j = 0; j < depth[i].length; j++)
      set(i, j, getScaled(c, linearMap(dist(displayWidth/2, displayHeight/2, i, j), 0, 200, 1.0, 0.8)));
}
