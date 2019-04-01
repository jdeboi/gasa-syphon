int numP = 0;

void displayPyramids(PGraphics canvas) {
  for (int i = 0; i < pyramids.size(); i++) {
    //pyramids.get(i).display(canvas, color(i, pyramids.size(), pyramids.size()));
    color brightC = Wheel(int(i*1.0/pyramids.size()*255));
    color medC = getColorWithBrightness(brightC, 200);
    color darkC = getColorWithBrightness(brightC, 100);
    pyramids.get(i).display(canvas, medC, darkC, brightC);
  }
}

class Pyramid {

  int x, y, s, id;
  boolean isUp;
  Triangle [] triangles;

  Pyramid(int x, int y, int s, boolean isUp) {
    this.x = x;
    this.y = y;
    this.s = s;
    this.isUp = isUp;

    this.id = numP++;

    triangles = new Triangle[3];
    triangles[0] = new Triangle(getPoints(0), isUp);
    triangles[1] = new Triangle(getPoints(1), isUp);
    triangles[2] = new Triangle(getPoints(2), isUp);
  }

  void display(PGraphics canvas) {
    for (Triangle t : triangles) {
      t.display(canvas);
    }
    //displayID(canvas);
  }

  void display(PGraphics canvas, color c) {
    display(canvas, c, c, c);
  }

  void display(PGraphics canvas, color c0, color c1, color c2) {
    triangles[0].display(canvas, c0);
    triangles[1].display(canvas, c1);
    triangles[2].display(canvas, c2);
  }

  void displayID(PGraphics canvas) {
    PVector p = new PVector(this.x+this.s/2, this.y-this.s/(2*sqrt(3)));
    if (!isUp) p = new PVector(this.x+this.s/2, this.y+this.s/(2*sqrt(3)));
    canvas.fill(255);
    canvas.noStroke();
    canvas.textSize(20);
    canvas.text(this.id, p.x, p.y);
  }

  PVector [] getPoints(int n) {
    PVector[] points = new PVector[4];
    if (isUp) {
      points[0] = new PVector(this.x, this.y);
      points[1] = new PVector(this.x + this.s/2, this.y - this.s/2*sqrt(3));
      points[2] = new PVector(this.x+ this.s, this.y);
      points[3] = new PVector(this.x+this.s/2, this.y-this.s/(2*sqrt(3)));
    } else {
      points[0] = new PVector(this.x, this.y);
      points[1] = new PVector(this.x + this.s/2, this.y + this.s/2*sqrt(3));
      points[2] = new PVector(this.x+ this.s, this.y);
      points[3] = new PVector(this.x+this.s/2, this.y+this.s/(2*sqrt(3)));
    }
    PVector [] returnPoints = new PVector[3];
    if (n == 0) {
      returnPoints[0] = points[0];
      returnPoints[1] = points[3];
      returnPoints[2] = points[1];
    } else if (n == 1) {
      returnPoints[0] = points[1];
      returnPoints[1] = points[3];
      returnPoints[2] = points[2];
    } else {
      returnPoints[0] = points[0];
      returnPoints[1] = points[3];
      returnPoints[2] = points[2];
    }
    return returnPoints;
  }
}
