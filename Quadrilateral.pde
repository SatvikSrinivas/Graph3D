
void quadrilateral3D_fill(float x1, float y1, float z1, float x2, float y2, float z2, float x3, float y3, float z3, float x4, float y4, float z4) {
  float centroid_x = (x1+x2+x3+x4) / 4, centroid_y = (y1+y2+y3+y4) / 4;
  Vector2D v1 = new Vector2D(x1 - centroid_x, y1 - centroid_y);
  Vector2D v2 = new Vector2D(x2 - centroid_x, y2 - centroid_y);
  Vector2D v3 = new Vector2D(x3 - centroid_x, y3 - centroid_y);
  Vector2D v4 = new Vector2D(x4 - centroid_x, y4 - centroid_y);
  Vector2D_Sortable[] ordered = new Vector2D_Sortable[] {
    new Vector2D_Sortable(0, v1, v1.angle()/PI),
    new Vector2D_Sortable(1, v2, v2.angle()/PI),
    new Vector2D_Sortable(2, v3, v3.angle()/PI),
    new Vector2D_Sortable(3, v4, v4.angle()/PI)
  };
  sort(ordered);
  Vector3D[] v = new Vector3D[] {new Vector3D(x1, y1, z1), new Vector3D(x2, y2, z2), new Vector3D(x3, y3, z3), new Vector3D(x4, y4, z4)};
  Vector2D[] v2D = new Vector2D[] {new Vector3D(x1, y1, z1).get2D_orthogonalProjection(), new Vector3D(x2, y2, z2).get2D_orthogonalProjection(),
    new Vector3D(x3, y3, z3).get2D_orthogonalProjection(), new Vector3D(x4, y4, z4).get2D_orthogonalProjection()};
  float quadArea = quadrilateralArea2D(v2D[ordered[0].id], v2D[ordered[1].id], v2D[ordered[2].id], v2D[ordered[3].id]),
    triArea1 = triangleArea2D(v2D[ordered[0].id], v2D[ordered[1].id], v2D[ordered[2].id]),
    triArea2 = triangleArea2D(v2D[ordered[0].id], v2D[ordered[1].id], v2D[ordered[3].id]);
  if (abs(triArea1/quadArea - 0.5) < abs(triArea2/quadArea - 0.5)) {
    triangle3D_fill(v[ordered[0].id], v[ordered[1].id], v[ordered[2].id]);
    triangle3D_fill(v[ordered[0].id], v[ordered[2].id], v[ordered[3].id]);
  } else {
    triangle3D_fill(v[ordered[0].id], v[ordered[1].id], v[ordered[3].id]);
    triangle3D_fill(v[ordered[1].id], v[ordered[2].id], v[ordered[3].id]);
  }
}

void quadrilateral2D_fill(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
  float centroid_x = (x1+x2+x3+x4) / 4, centroid_y = (y1+y2+y3+y4) / 4;
  Vector2D v1 = new Vector2D(x1 - centroid_x, y1 - centroid_y);
  Vector2D v2 = new Vector2D(x2 - centroid_x, y2 - centroid_y);
  Vector2D v3 = new Vector2D(x3 - centroid_x, y3 - centroid_y);
  Vector2D v4 = new Vector2D(x4 - centroid_x, y4 - centroid_y);
  Vector2D_Sortable[] ordered = new Vector2D_Sortable[] {
    new Vector2D_Sortable(0, v1, v1.angle()/PI),
    new Vector2D_Sortable(1, v2, v2.angle()/PI),
    new Vector2D_Sortable(2, v3, v3.angle()/PI),
    new Vector2D_Sortable(3, v4, v4.angle()/PI)
  };
  sort(ordered);
  Vector2D[] v = new Vector2D[] {new Vector2D(x1, y1), new Vector2D(x2, y2), new Vector2D(x3, y3), new Vector2D(x4, y4)};
  float quadArea = quadrilateralArea2D(v[ordered[0].id], v[ordered[1].id], v[ordered[2].id], v[ordered[3].id]),
    triArea1 = triangleArea2D(v[ordered[0].id], v[ordered[1].id], v[ordered[2].id]),
    triArea2 = triangleArea2D(v[ordered[0].id], v[ordered[1].id], v[ordered[3].id]);
  if (abs(triArea1/quadArea - 0.5) < abs(triArea2/quadArea - 0.5)) {
    triangle2D_fill(v[ordered[0].id], v[ordered[1].id], v[ordered[2].id]);
    triangle2D_fill(v[ordered[0].id], v[ordered[2].id], v[ordered[3].id]);
  } else {
    triangle2D_fill(v[ordered[0].id], v[ordered[1].id], v[ordered[3].id]);
    triangle2D_fill(v[ordered[1].id], v[ordered[2].id], v[ordered[3].id]);
  }
}

void quadrilateral2D_border(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
  float centroid_x = (x1+x2+x3+x4) / 4, centroid_y = (y1+y2+y3+y4) / 4;
  Vector2D v1 = new Vector2D(x1 - centroid_x, y1 - centroid_y);
  Vector2D v2 = new Vector2D(x2 - centroid_x, y2 - centroid_y);
  Vector2D v3 = new Vector2D(x3 - centroid_x, y3 - centroid_y);
  Vector2D v4 = new Vector2D(x4 - centroid_x, y4 - centroid_y);
  Vector2D_Sortable[] arr = new Vector2D_Sortable[] {
    new Vector2D_Sortable(0, v1, v1.angle()/PI),
    new Vector2D_Sortable(1, v2, v2.angle()/PI),
    new Vector2D_Sortable(2, v3, v3.angle()/PI),
    new Vector2D_Sortable(3, v4, v4.angle()/PI)
  };
  sort(arr);
  Vector2D[] v = new Vector2D[] {new Vector2D(x1, y1), new Vector2D(x2, y2), new Vector2D(x3, y3), new Vector2D(x4, y4)};
  line2D(v[arr[0].id], v[arr[1].id]);
  line2D(v[arr[1].id], v[arr[2].id]);
  line2D(v[arr[2].id], v[arr[3].id]);
  line2D(v[arr[3].id], v[arr[0].id]);
}

class Vector2D_Sortable {
  Vector2D v;
  float data;
  int id;
  public Vector2D_Sortable(int id, Vector2D v, float data) {
    this.id = id;
    this.v = v;
    this.data = data;
  }
  public String toString() {
    return "("+id+") "+ v.toString() + " --> "+data;
  }
}

// bubbleSort implementation used as arr.length is assumed to be equal to 4
static void sort(Vector2D_Sortable[] arr) {
  Vector2D_Sortable temp;
  for (int i = 0; i < arr.length - 1; i++)
    for (int j = 0; j < arr.length - i - 1; j++)
      if (arr[j].data > arr[j + 1].data) {
        temp = arr[j];
        arr[j] = arr[j+1];
        arr[j+1] = temp;
      }
}

// quadrilateralArea2D() assumes that A, B, C, D are given in counter-clockwise ordering
float quadrilateralArea2D(Vector2D A, Vector2D B, Vector2D C, Vector2D D) {
  return triangleArea2D(A, B, C) + triangleArea2D(A, D, C);
}

void quadrilateral2D_Tester() {
  setFillColor(yellow);
  setStrokeWeight(2.5);
  quadrilateral2D_fill(quadrilateral2D_Tester_x, quadrilateral2D_Tester_y, -SCALE, 0, 0, SCALE, -SCALE/2, -SCALE/2);
  quadrilateral2D_border(quadrilateral2D_Tester_x, quadrilateral2D_Tester_y, -SCALE, 0, 0, SCALE, -SCALE/2, -SCALE/2);
  setFillColor(green);
  setPointRadius(5);
  point2D(quadrilateral2D_Tester_x, quadrilateral2D_Tester_y);
  setFillColor(red);
  point2D(-SCALE, 0);
  point2D(0, SCALE);
  point2D(-SCALE/2, -SCALE/2);
}

float quadrilateral2D_Tester_x, quadrilateral2D_Tester_y;

void mousePressed() {
  quadrilateral2D_Tester_x = mouseX();
  quadrilateral2D_Tester_y = mouseY();
}
