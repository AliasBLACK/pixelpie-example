import ddf.minim.*;

Minim minim;
PixelPie pie;

void setup() {
  
  // Setup enviroment.
  size(1366, 768, P2D);
  noSmooth();
  
  // Init Minim and PixelPie.
  minim = new Minim(this);
  pie = new PixelPie(this, minim);
  
  // Setup PixelPie.
  pie.pixelSize = 2;
  pie.displayFPS = true;
  
  // Load initial level.
  pie.loadLevel("interior");
}

void draw() {}

public class character extends gameObject {
  public character() {super(pie);}
  
  public void init() {
    setSprite("walk_down");
  }
  
  public void update() {
    pie.cameraX = x - (width/pie.pixelSize)/2;
    pie.cameraY = y - (height/pie.pixelSize)/2;
  }
}