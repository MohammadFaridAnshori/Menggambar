int cloudX1 = 500;
int cloudX2 = 200;
int cloudX3 = 700;

void setup() {
  size(800, 600);
  background(135, 206, 235); // Sky blue background
}

void draw() {
  background(135, 206, 235); // Refresh background

  fill(255);
  noStroke();
  
  // Draw clouds
  drawCloud(cloudX1, 50);
  drawCloud(cloudX2, 100);
  drawCloud(cloudX3, 150);
  
  // Move clouds
  cloudX1 -= 1;
  cloudX2 -= 1;
  cloudX3 -= 1;
  
  // Reset cloud position
  if (cloudX1 < -100) cloudX1 = width;
  if (cloudX2 < -100) cloudX2 = width - 100;
  if (cloudX3 < -100) cloudX3 = width - 200;
  
  // Draw the deck
  fill(255); // Deck green color
  rect(0, height/2 + 50, width, height/2 - 50);
  
  // Draw the sea
  fill(169, 169, 169); // Sea blue color
  rect(0, height/2 + 150, width, height/2 - 150);
  
  // Draw the first person
  drawPerson(width/2 - 50, height/2, color(255), color(0)); // Orang pertama

  // Draw the second person
  drawPerson(width/2 + 50, height/2, color(169, 169, 169), color(139, 69, 19)); // Orang kedua
  
  // Draw ship railings
  stroke(0); // Black color for railings
  strokeWeight(4);
  for (int i = 50; i < width; i += 100) {
    line(i, height/2 + 50, i, height/2);
  }
  line(0, height/2, width, height/2);
}

void drawCloud(int x, int y) {
  ellipse(x, y, 80, 60);
  ellipse(x - 30, y + 10, 60, 50);
  ellipse(x + 30, y + 10, 60, 50);
  ellipse(x - 15, y - 20, 70, 60);
  ellipse(x + 15, y - 20, 70, 60);
}

void drawPerson(float x, float y, color shirtColor, color hairColor) {
  // Draw the head
  fill(255, 224, 189); // Skin color
  ellipse(x, y - 70, 40, 40); // Head
  
  // Draw the hair
  fill(hairColor); // Hair color
  if (hairColor == color(0)) {
    arc(x, y - 80, 40, 40, PI, TWO_PI);
  } else {
    beginShape();
    vertex(x - 20, y - 70);
    vertex(x - 10, y - 90);
    vertex(x, y - 70);
    vertex(x + 10, y - 90);
    vertex(x + 20, y - 70);
    endShape(CLOSE);
  }
  
  // Draw the body
  fill(shirtColor); // Shirt color
  rect(x - 15, y - 50, 30, 60); // Body
  
  // Draw the legs
  fill(0); // Black color for pants
  rect(x - 15, y + 10, 10, 30); // Left leg
  rect(x + 5, y + 10, 10, 30); // Right leg
  
  // Draw the arms
  fill(shirtColor); // Shirt color
  rect(x - 25, y - 50, 10, 40); // Left arm
  rect(x + 15, y - 50, 10, 40); // Right arm
  
  // Draw the eyes
  fill(0); // Eye color
  ellipse(x - 5, y - 75, 5, 5); // Left eye
  ellipse(x + 5, y - 75, 5, 5); // Right eye
  
  // Draw the mouth
  fill(0);
  arc(x, y - 65, 10, 5, 0, PI);
  

}
