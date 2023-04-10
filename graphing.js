
import * as THREE from 'three';

export function point3D(x, y, z, c) {
  const geometry = new THREE.SphereGeometry(0.1, 32, 16);
  const material = new THREE.MeshBasicMaterial({ color: c });
  const point3D = new THREE.Mesh(geometry, material);
  point3D.position.set(x, z, -y);
  return point3D;
}

export function line3D(x1, y1, z1, x2, y2, z2, c) {
  const material = new THREE.LineBasicMaterial({ color: c, linewidth: 5 });
  const points = [];
  points.push(new THREE.Vector3(x1, z1, -y1));
  points.push(new THREE.Vector3(x2, z2, -y2));
  const geometry = new THREE.BufferGeometry().setFromPoints(points);
  const line3D = new THREE.Line(geometry, material);
  return line3D;
}