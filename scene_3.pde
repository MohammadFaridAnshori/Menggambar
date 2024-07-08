int cloudX1 = 500;
int cloudX2 = 200;
int cloudX3 = 700;
float diverY;
boolean isDiving = false;
float diverX;
boolean diverInWater = false;

void setup() {
  size(800, 600);
  background(135, 206, 235); // Sky blue background
  diverY = height / 2;
  diverX = width / 2 + 120; // Start position at the end of the diving board
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
  
  // Draw the body ship
  fill(169,169,169); // body grey color
  rect(0, height/2 + 150, width, height/2 - 150);
  
  // Draw the diving board
  drawDivingBoard(width/2 + 70, height/2);
  
  // Draw the first person
  drawPerson(width/2 - 50, height/2, color(255), color(0), false); // Orang pertama

  // Draw the second person (diver)
  if (!isDiving && !diverInWater) {
    drawPerson(width/2 + 70, height/2, color(255, 0, 0), color(0), true); // Orang kedua, menyesuaikan posisi agar tidak bertumpuk
  } else if (isDiving) {
    drawDivingPerson(diverX, diverY, color(255, 0, 0), color(0)); // Animasi lompat
    diverY += 1; // Adjust this value to control the speed of the dive
    if (diverY > height / 2 + 150) {
      diverInWater = true;
    }
    if (diverY > height) {
      isDiving = false; // Stop diving after the diver moves out of the visible area
    }
  }
  
  // Draw ship railings
  stroke(0); // Black color for railings
  strokeWeight(4);
  for (int i = 50; i < width; i += 100) {
    line(i, height/2 + 50, i, height/2);
  }
  line(0, height/2, width, height/2);
  
  // Draw diver in water if they have jumped
  if (diverInWater && diverY <= height) {
    drawDiverInWater(diverX, diverY, color(255, 0, 0));
  }
}

void drawCloud(int x, int y) {
  ellipse(x, y, 80, 60);
  ellipse(x - 30, y + 10, 60, 50);
  ellipse(x + 30, y + 10, 60, 50);
  ellipse(x - 15, y - 20, 70, 60);
  ellipse(x + 15, y - 20, 70, 60);
}

void drawPerson(float x, float y, color shirtColor, color hairColor, boolean isDiver) {
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
  
  if (isDiver) {
    // Draw diver suit details
    fill(0); // Black color for details
    rect(x - 15, y - 50, 30, 10); // Suit neck
    ellipse(x, y - 30, 10, 10); // Suit detail
  }
  
  // Draw the legs
  if (isDiver) {
    // Adjust legs for diving position
    fill(shirtColor);
    rect(x - 15, y + 10, 10, 30); // Left leg (diving)
    rect(x - 5, y + 10, 10, 30); // Right leg (diving)
    fill(0); // Black color for flippers
    triangle(x - 20, y + 40, x - 5, y + 40, x - 15, y + 60); // Left flipper
    triangle(x - 10, y + 40, x + 5, y + 40, x - 5, y + 60); // Right flipper
  } else {
    fill(0); // Black color for pants
    rect(x - 15, y + 10, 10, 30); // Left leg
    rect(x + 5, y + 10, 10, 30); // Right leg
  }
  
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

void drawDivingPerson(float x, float y, color shirtColor, color hairColor) {
  // Draw the head
  fill(255, 224, 189); // Skin color
  ellipse(x, y - 70, 40, 40); // Head
  
  // Draw the hair
  fill(hairColor); // Hair color
  arc(x, y - 80, 40, 40, PI, TWO_PI);
  
  // Draw the body
  fill(shirtColor); // Shirt color
  rect(x - 15, y - 50, 30, 60); // Body
  
  // Draw the legs (diving position)
  fill(shirtColor);
  rect(x - 15, y + 10, 10, 30); // Left leg (diving)
  rect(x - 5, y + 10, 10, 30); // Right leg (diving)
  fill(0); // Black color for flippers
  triangle(x - 20, y + 40, x - 5, y + 40, x - 15, y + 60); // Left flipper
  triangle(x - 10, y + 40, x + 5, y + 40, x - 5, y + 60); // Right flipper
  
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

void drawDiverInWater(float x, float y, color shirtColor) {
  
}

void drawDivingBoard(float x, float y) {
  fill(160, 82, 45); // Brown color for the diving board
  rect(x, y - 10, 100, 10); // Horizontal part of the diving board
  rect(x + 90, y - 10, 10, 40); // Vertical support of the diving board
}

void keyPressed() {
  if (key == 'd' || key == 'D') {
    isDiving = true;
    diverY = height / 2; // Reset diver's y position to start of the dive
    diverX = width / 2 + 120; // Reset diver's x position to the end of the diving board
    diverInWater = false; // Reset the diver in water flag
  }
}
