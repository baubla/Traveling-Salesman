PVector sales[];
int order[];
int nextOrder[];
int saleDiameter = 10;
boolean finished = false;

void setup() {
  size(640, 360);
  int numSales = 5; //floor(random(6, 9));
  sales = new PVector[numSales];
  order = new int[numSales];
  for (int i = 0; i < numSales; i++) {
    int x = floor(random(0 + saleDiameter, width  - saleDiameter));
    int y = floor(random(0 + saleDiameter, height - saleDiameter));
    sales[i] = new PVector(x, y);
    order[i] = i;
  }
}

void draw() {
  background(0);

  noStroke();
  fill(255);
  for (int i = 0; i < sales.length; i++) {
    ellipse(sales[i].x, sales[i].y, saleDiameter, saleDiameter);
  }

  nextOrder = getNextOrder(order);
}

int[] getNextOrder(int[] o) {
  int l = o.length;
  int largestI = -1;
  for (int i = 0; i < l - 1; i++) {
    if (o[i] < o[i+1] && i > largestI) {
      largestI = i;
    }
  }
  if (largestI == -1) {
    finished = true;
  }
  int largestJ = 0;
  for (int j = 0; j < l - 1; j++) {
    if (o[largestI] < o[j] && j > largestJ) {
      largestJ = j;
    }
  }
  int oldSaleI = o[largestI];
  o[largestJ] = o[largestI];
  o[largestI] = oldSaleI;
  
  int b[] = new int[largestI + 1];
  arrayCopy(o, b, largestI + 1);
  
  int f[] = new int[l - largestI - 1];
  arrayCopy(o, largestI + 1, f, 0, l - largestI - 1);
  f = reverse(f);
  
  return concat(b, f);
}