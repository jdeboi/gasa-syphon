import codeanticode.syphon.*;

PGraphics canvas;
SyphonServer server;

int spacing = 30;

ArrayList<Pyramid> pyramids;

void setup() { 
  size(1200, 800, P3D);
  canvas = createGraphics(1200, 800, P3D);

  float scaleFactor = 4.5;
  int bigS = int(100*scaleFactor);
  int bigH = int(bigS/2.0*sqrt(3));
  int medS = int(60* scaleFactor);
  int medH = int(medS/2.0*sqrt(3));
  int smallS = int(30*scaleFactor);
  int smallH = int(smallS/2.0*sqrt(3));

  pyramids = new ArrayList<Pyramid>();
  int x = 30;
  int y = height - 100;
  
  pyramids.add(new Pyramid(x, y+spacing, bigS, true)); // big 0
  pyramids.add(new Pyramid(x+bigS-smallS/2+spacing, y-smallH+spacing, smallS, false)); // 1
  x += bigS/2+spacing;
  y -= bigH;
  pyramids.add(new Pyramid(x, y, medS, false)); //2
  pyramids.add(new Pyramid(x, y-spacing, medS, true)); //3
  x += medS/2+spacing;
  y += medH;
  pyramids.add(new Pyramid(x, y+spacing, medS, true)); // 4
  x += medS/2+spacing;
  y -= medH;
  pyramids.add(new Pyramid(x, y, medS, false)); // 5
  pyramids.add(new Pyramid(int(x +14*scaleFactor), y+bigH+spacing, bigS, true)); // 6
  x += medS+spacing;
  pyramids.add(new Pyramid(x, y, medS, false)); // 7

  // Create syhpon server to send frames out.
  server = new SyphonServer(this, "Processing Syphon");
}

void draw() {

  canvas.beginDraw();
  canvas.background(0);


  displayPyramids(canvas);

  canvas.endDraw();

  image(canvas, 0, 0);
  server.sendImage(canvas);
}

// adafruit neopixel lib
// https://github.com/adafruit/Adafruit_NeoPixel/blob/master/examples/strandtest/strandtest.ino
color Wheel(int WheelPos) {
  WheelPos = 255 - WheelPos;
  if (WheelPos < 85) {
    color c = color(255 - WheelPos * 3, 0, WheelPos * 3);
    return c;
  }
  if (WheelPos < 170) {
    WheelPos -= 85;
    color c= color(0, WheelPos * 3, 255 - WheelPos * 3);
    return c;
  }
  WheelPos -= 170;
  color c= color(WheelPos * 3, 255 - WheelPos * 3, 0);
  return c;
}

color getColorWithBrightness(color c, int br) {
  colorMode(HSB, 255);
  float h = hue(c);
  color c2 = color(h, 255, br);
  colorMode(RGB, 255);
  return c2;
}
