function setup() {
  createCanvas(400, 400);
  background(0);
  stroke(255);
}

function draw() {
  if (mouseIsPressed) {
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}