import ddf.minim.Minim;

Minim minim;
PixelPie pie;

void setup() {
  size(800, 600, P2D);
  
  // Init Minim and PixelPie.
  minim = new Minim(this);
  pie = new PixelPie(this, minim, 2);
  
  // Show FPS.
  pie.displayFPS = true;
  
  // Load initial level.
  pie.loadLevel("interior");
}

void draw() {}

public class wall extends gameObject {
  public wall() {super(pie);}
}