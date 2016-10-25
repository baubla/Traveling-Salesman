PVector sales[];
int order[];
int saleDiameter = 10;

void setup() {
  size(640, 360);
  int numSales = floor(random(6, 9));
  sales = new PVector[numSales];
  for (int i = 0; i < numSales; i++) {
    int x = floor(random(0 + saleDiameter, width  - saleDiameter));
    int y = floor(random(0 + saleDiameter, height - saleDiameter));
    sales[i] = new PVector(x, y);
  }
}

void draw() {
  background(0);
  
  noStroke();
  fill(255);
  for (int i = 0; i < sales.length; i++) {
    ellipse(sales[i].x, sales[i].y, saleDiameter, saleDiameter);
  }
}