
float[][] depth;
final float BASE_DEPTH = -Float.MAX_VALUE;
float MIN_DEPTH, MAX_DEPTH;

void instantiateDepthMatrix() {
  depth = new float[displayWidth][displayHeight];
  for (int i = 0; i < depth.length; i++)
    for (int j = 0; j < depth[i].length; j++)
      depth[i][j] = BASE_DEPTH;
}

void displayDepthMatrix() {
  for (int i = 0; i < depth.length; i++) {
    for (int j = 0; j < depth[i].length; j++)
      if (depth[i][j] != BASE_DEPTH)
        println("depth["+i+"]["+j+"] = "+round(depth[i][j]));
  }
}

float DEPTH = BASE_DEPTH; // helper variable
void setDepth(float depth) {
  DEPTH = depth;
}
