import './style.css'
import * as THREE from 'three';

const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
const renderer = new THREE.WebGLRenderer({
  canvas: document.querySelector('#bg'),
});

renderer.setPixelRatio(window.devicePixelRatio);
renderer.setSize(window.innerWidth, window.innerHeight);
renderer.shadowMap.enabled = true;
camera.position.setZ(30);

const gridHelper = new THREE.GridHelper(200, 50);
// scene.add(gridHelper);

import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls';
const controls = new OrbitControls(camera, renderer.domElement);

const red = 0xff0000, green = 0x00ff00, blue = 0x0000ff, white = 0xffffff,
  orange = 0xf2a23a, lightBlue = 0xADD8E6;
const TAU = 6.28318531;

// AMBIENT LIGHT
scene.add(new THREE.AmbientLight(0xffffff, 0.5));
// DIRECTIONAL LIGHT
const dirLight = new THREE.DirectionalLight(0xffffff, 1.0)
dirLight.position.x += 20
dirLight.position.y += 20
dirLight.position.z += 20
dirLight.castShadow = true
dirLight.shadow.mapSize.width = 4096;
dirLight.shadow.mapSize.height = 4096;
const d = 25;
dirLight.shadow.camera.left = - d;
dirLight.shadow.camera.right = d;
dirLight.shadow.camera.top = d;
dirLight.shadow.camera.bottom = - d;

let target = new THREE.Object3D();
target.position.z = -20;
dirLight.target = target;
dirLight.target.updateMatrixWorld();

dirLight.shadow.camera.lookAt(0, 0, -30);
scene.add(dirLight);
// scene.add(new THREE.CameraHelper(dirLight.shadow.camera));

import { point3D, line3D } from './graphing.js';
import { DirectionalLight } from 'three';

function spiral(R) {
  for (let theta = -5 * TAU; theta < 5 * TAU; theta += 0.01)
    scene.add(point3D(R * Math.cos(theta), R * Math.sin(theta), theta, red))
}
// spiral(10);

function axes() {
  scene.add(line3D(0, 0, 0, 1, 0, 0, red));
  scene.add(line3D(0, 0, 0, 0, 1, 0, green));
  scene.add(line3D(0, 0, 0, 0, 0, 1, blue));
}
// axes();

function triangle3D(x1, y1, z1, x2, y2, z2, x3, y3, z3, c) {
  const geometry = new THREE.BufferGeometry();
  const vertices = new Float32Array([
    x1, z1, -y1,
    x2, z2, -y2,
    x3, z3, -y3,
  ]);
  geometry.setAttribute('position', new THREE.BufferAttribute(vertices, 3));
  const material = new THREE.MeshBasicMaterial({ color: c });
  const mesh = new THREE.Mesh(geometry, material);
  return mesh;
}

const plane_geometry = new THREE.PlaneGeometry(5, 5, 250, 250);
// const plane_geometry = new THREE.PlaneGeometry(5, 5, 500, 500);
const wireFrame_geometry = new THREE.WireframeGeometry(plane_geometry);

function plane() {
  const plane = new THREE.Mesh(plane_geometry,
    new THREE.MeshNormalMaterial({ color: lightBlue, side: THREE.DoubleSide }));
  // new THREE.MeshDistanceMaterial({ color: lightBlue, side: THREE.DoubleSide }));
  plane.receiveShadow = true;
  plane.castShadow = true;
  plane.rotation.x = - Math.PI / 2;
  scene.add(plane);
  const wireFrameMaterial = new THREE.LineBasicMaterial({
    color: 0xffffff,
    linewidth: 2
  });
  const wireFrame = new THREE.LineSegments(wireFrame_geometry, wireFrameMaterial);
  // scene.add(wireFrame);
}
plane();

function paraboloid() {
  for (let i = 0; i < plane_geometry.attributes.position.count; i++) {
    const x = plane_geometry.attributes.position.getX(i)
    const y = plane_geometry.attributes.position.getY(i)
    const z = 0.8 * (3.5 * x / Math.exp((x ^ 2 + y ^ 2)) - y / Math.exp((x ^ 2 + y ^ 2)) + 0.7 * Math.sin(x * y) * 1.5 * Math.cos(2 * x))
    // const z = 7 * x * y / Math.exp(x * x + y * y);
    // const z =
    plane_geometry.attributes.position.setZ(i, z);

    // const a = wireFrame_geometry.attributes.position.getX(i)
    // const b = wireFrame_geometry.attributes.position.getY(i)
    // const c = 7 * a * b / Math.exp(a * a + b * b);
    // wireFrame_geometry.attributes.position.setX(i, a);
    // wireFrame_geometry.attributes.position.setY(i, b);
    // wireFrame_geometry.attributes.position.setZ(i, c);
  }
  plane_geometry.computeVertexNormals()
  plane_geometry.attributes.position.needsUpdate = true;
  // wireFrame_geometry.computeVertexNormals()
  // wireFrame_geometry.attributes.position.needsUpdate = true;
}

function animate() {
  // animatePlane();
  paraboloid();
  requestAnimationFrame(animate);
  controls.update();
  renderer.render(scene, camera);
}
animate();