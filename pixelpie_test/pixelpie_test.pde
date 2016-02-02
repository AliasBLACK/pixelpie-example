import ddf.minim.Minim;

PixelPie pie;
PixelOven oven;

void setup() {
  size(800, 600, P2D);
  
  // Init Minim and PixelPie.
  oven = new PixelOvenJava(this);
  pie = new PixelPie(this, oven, 2);
  
  // Show FPS.
  pie.displayFPS = true;
  
  // Load initial level.
  pie.loadLevel("interior");
}

void draw() {}

public class wall extends GameObject {
  public wall() {super(pie);}
}