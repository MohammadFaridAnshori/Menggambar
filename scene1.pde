int cloudX1 = 500;
int cloudX2 = 200;
float waveOffset = 0.0;
float boatY = 350;

void setup() {
  size(800, 500);
  background(135, 206, 235); // langit
}

void draw() {
  background(135, 206, 235); 
  
  drawClouds();
  drawBoat(); 
  drawSea(); 
  
}

void drawClouds() {
  fill(255);
  noStroke();
  
  // Draw clouds
  ellipse(cloudX1, 50, 80, 60);
  ellipse(cloudX1 - 40, 60, 70, 50);
  ellipse(cloudX1 + 40, 60, 70, 50);

  ellipse(cloudX2, 100, 80, 60);
  ellipse(cloudX2 - 40, 110, 70, 50);
  ellipse(cloudX2 + 40, 110, 70, 50);
  
  // Move clouds
  cloudX1 -= 1;
  cloudX2 -= 1;
  
  // Reset cloud position
  if (cloudX1 < -100) cloudX1 = width;
  if (cloudX2 < -100) cloudX2 = width - 100;
}

void drawBoat() {
  // Boat body
  fill(169, 169, 169);
  stroke(0);
  strokeWeight(2);
  beginShape();
  vertex(100, boatY);
  vertex(700, boatY);
  vertex(650, boatY + 100);
  vertex(150, boatY + 100);
  endShape(CLOSE);
  
  // Boat deck
  fill(255);
  beginShape();
  vertex(150, boatY);
  vertex(650, boatY);
  vertex(600, boatY + 50);
  vertex(200, boatY + 50);
  endShape(CLOSE);
  
  // Boat structure
  fill(70, 130, 180);
  rect(300, boatY - 100, 200, 100); // Lower part
  rect(350, boatY - 150, 100, 50); // Upper part
  
  // Boat details
  line(150, boatY, 200, boatY - 50);
  line(200, boatY - 50, 600, boatY - 50);
  line(600, boatY - 50, 650, boatY);
  line(350, boatY - 100, 450, boatY - 100);
}

void drawSea() {
  fill(0, 0, 139);
  noStroke();
  beginShape();
  for (int x = 0; x <= width; x++) {
    float y = 400 + 20 * sin(TWO_PI * (x / 100.0) + waveOffset);
    vertex(x, y);
  }
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);

  // Move the waves
  waveOffset += 0.05;

  // Sea details
  stroke(0, 191, 255);
  strokeWeight(4);
  for (int i = 0; i < width; i += 20) {
    float y1 = 420 + 10 * sin(TWO_PI * (i / 100.0) + waveOffset);
    float y2 = 430 + 10 * sin(TWO_PI * ((i + 10) / 100.0) + waveOffset);
    line(i, y1, i + 10, y2);
  }
}
