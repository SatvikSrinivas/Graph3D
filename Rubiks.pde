
int dim = 400, half_dim = dim/2;
float size = 2;

boolean rubiks;
void rubiks() {
  rubiks = true;
  rubiksFaces();
  rubiksFrame();
}

void rubiksFaces() {
  for (int x = -half_dim; x <= half_dim; x++)
    for (int y = -half_dim; y <= half_dim; y++) {
      point3D(x, y, half_dim, size, blue); // Front
      point3D(x, y, -half_dim, size, green); // Back
      point3D(-half_dim, x, y, size, red); // Left
      point3D(half_dim, x, y, size, purple); // Right
      point3D(x, half_dim, y, size, white); // Up
      point3D(x, -half_dim, y, size, yellow); // Down
    }
}

Vector3D left_right = new Vector3D(dim, 0, 0), up_down = new Vector3D(0, dim, 0), front_back = new Vector3D(0, 0, dim);
float rubiks_Size = 4;
void rubiksFrame() {
  // FRONT
  up_down.draw(new Vector3D(-half_dim, -half_dim, half_dim), black, rubiks_Size);
  up_down.draw(new Vector3D(0, -half_dim, half_dim), black, rubiks_Size);
  up_down.draw(new Vector3D(half_dim, -half_dim, half_dim), black, rubiks_Size);
  left_right.draw(new Vector3D(-half_dim, half_dim, half_dim), black, rubiks_Size);
  left_right.draw(new Vector3D(-half_dim, 0, half_dim), black, rubiks_Size);
  left_right.draw(new Vector3D(-half_dim, -half_dim, half_dim), black, rubiks_Size);

  // BACK
  up_down.draw(new Vector3D(-half_dim, -half_dim, -half_dim), black, rubiks_Size);
  up_down.draw(new Vector3D(0, -half_dim, -half_dim), black, rubiks_Size);
  up_down.draw(new Vector3D(half_dim, -half_dim, -half_dim), black, rubiks_Size);
  left_right.draw(new Vector3D(-half_dim, half_dim, -half_dim), black, rubiks_Size);
  left_right.draw(new Vector3D(-half_dim, 0, -half_dim), black, rubiks_Size);
  left_right.draw(new Vector3D(-half_dim, -half_dim, -half_dim), black, rubiks_Size);

  // LEFT
  up_down.draw(new Vector3D(-half_dim, -half_dim, half_dim), black, rubiks_Size);
  up_down.draw(new Vector3D(-half_dim, -half_dim, 0), black, rubiks_Size);
  up_down.draw(new Vector3D(-half_dim, -half_dim, -half_dim), black, rubiks_Size);
  front_back.draw(new Vector3D(-half_dim, half_dim, -half_dim), black, rubiks_Size);
  front_back.draw(new Vector3D(-half_dim, 0, -half_dim), black, rubiks_Size);
  front_back.draw(new Vector3D(-half_dim, -half_dim, -half_dim), black, rubiks_Size);

  // RIGHT
  up_down.draw(new Vector3D(half_dim, -half_dim, half_dim), black, rubiks_Size);
  up_down.draw(new Vector3D(half_dim, -half_dim, 0), black, rubiks_Size);
  up_down.draw(new Vector3D(half_dim, -half_dim, -half_dim), black, rubiks_Size);
  front_back.draw(new Vector3D(half_dim, half_dim, -half_dim), black, rubiks_Size);
  front_back.draw(new Vector3D(half_dim, 0, -half_dim), black, rubiks_Size);
  front_back.draw(new Vector3D(half_dim, -half_dim, -half_dim), black, rubiks_Size);

  // UP
  front_back.draw(new Vector3D(-half_dim, half_dim, -half_dim), black, rubiks_Size);
  front_back.draw(new Vector3D(0, half_dim, -half_dim), black, rubiks_Size);
  front_back.draw(new Vector3D(half_dim, half_dim, -half_dim), black, rubiks_Size);
  left_right.draw(new Vector3D(-half_dim, half_dim, -half_dim), black, rubiks_Size);
  left_right.draw(new Vector3D(-half_dim, half_dim, 0), black, rubiks_Size);
  left_right.draw(new Vector3D(-half_dim, half_dim, half_dim), black, rubiks_Size);

  // DOWN
  front_back.draw(new Vector3D(-half_dim, -half_dim, -half_dim), black, rubiks_Size);
  front_back.draw(new Vector3D(0, -half_dim, -half_dim), black, rubiks_Size);
  front_back.draw(new Vector3D(half_dim, -half_dim, -half_dim), black, rubiks_Size);
  left_right.draw(new Vector3D(-half_dim, -half_dim, -half_dim), black, rubiks_Size);
  left_right.draw(new Vector3D(-half_dim, -half_dim, 0), black, rubiks_Size);
  left_right.draw(new Vector3D(-half_dim, -half_dim, half_dim), black, rubiks_Size);
}
