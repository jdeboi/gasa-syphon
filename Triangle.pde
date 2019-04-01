int tid;

class Triangle {

  PVector [] points;
  color col, strokeCol;
  int sw = 3;
  int id = (tid++)%3;
  boolean isUp;

  Triangle(PVector [] points, boolean isUp) {
    this.isUp = isUp;
    this.points = points;
    col = color(255, 0, 0);
    strokeCol = color(255);
  }

  void display(PGraphics canvas) {
    display(canvas, this.col, this.strokeCol, this.sw);
  }

  void display(PGraphics canvas, color c) {
    canvas.pushMatrix();
    if (id == 0) canvas.translate(-spacing/3, 0);

    else if (id == 1)  canvas.translate(spacing/3, 0);
    else if (id == 2) {
      if (isUp) canvas.translate(0, spacing/3);
      else canvas.translate(0, -spacing/3);
    }
    display(canvas, c, this.strokeCol, this.sw);
    canvas.popMatrix();
  }

  void display(PGraphics canvas, color c, color sc, int w) {
    canvas.fill(c);
    canvas.stroke(sc);
    canvas.strokeWeight(w);
    canvas.beginShape();
    canvas.vertex(points[0].x, points[0].y);
    canvas.vertex(points[1].x, points[1].y);
    canvas.vertex(points[2].x, points[2].y);
    canvas.endShape(CLOSE);
  }
}
