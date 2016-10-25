PVector sales[];
int order[];

void setup() {
  size(1280, 720);
  int numSales = floor(random(3, 5));
  sales = new PVector[numSales];
  for (int i = 0; i < numSales; i++) {
    sales[i] = PVector.random2D();
  }
}

void draw() {
}