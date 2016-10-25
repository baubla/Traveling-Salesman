PVector sales[];
int order[];
int nextOrder[];
int saleDiameter = 10;
boolean finished = false;

void setup() {
  size(640, 360);
  frameRate(2);
  int numSales = 4; //floor(random(6, 9));
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

  if (!finished) {
    stroke(255);
    strokeWeight(4);
    for (int i = 0; i < order.length - 1; i++) {
      int i1 = order[i];
      int i2 = order[i+1];
      line(sales[i1].x, sales[i1].y, sales[i2].x, sales[i2].y);
    }
    
    order = getNextOrder(order);
  }

  noStroke();
  fill(255);
  for (int i = 0; i < sales.length; i++) {
    ellipse(sales[i].x, sales[i].y, saleDiameter, saleDiameter);
  }

}

int[] getNextOrder(int[] o) {
  println(o);
  int l = o.length;
  int largestI = -1;
  for (int i = 0; i < l - 1; i++) {
    if (o[i] < o[i+1] && i > largestI) {
      largestI = i;
    }
  }
  if (largestI == -1) {
    finished = true;
    int empty[] = new int[l];
    for (int i = 0; i < l; i++) {
      empty[i] = -1;
    }
    println("did not find largestI");
    return empty;
  }
  int largestJ = -1;
  for (int j = 0; j < l; j++) {
    if (o[largestI] < o[j] && j > largestJ) {
      largestJ = j;
    }
  }
  int oldSaleJ = o[largestJ];
  o[largestJ] = o[largestI];
  o[largestI] = oldSaleJ;

  int b[] = new int[largestI + 1];
  arrayCopy(o, b, largestI + 1);

  int f[] = new int[l - largestI - 1];
  arrayCopy(o, largestI + 1, f, 0, l - largestI - 1);
  f = reverse(f);

  int ff[] = concat(b, f);
  println(ff);
  return ff;
}