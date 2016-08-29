import ddf.minim.Minim;  // Comment this line out for Android.

PixelPie pie;
PixelOven oven;

void setup() {
  
  // Enable fullscreen.
  fullScreen(P2D);
  
  // Init PixelOven.
  oven = new PixelOvenJava(this);        // Use this if running on Mac, Linux or Windows.
  //oven = new PixelOvenAndroid(this);   // Use this if running on Android.
  
  // Init PixelPie.
  pie = new PixelPie(this, oven, 2, 60.0);
  
  // Show FPS.
  pie.displayFPS = true;
  
  // Load initial level.
  pie.loadLevel("interior");
}

void draw() {
  
  // Display loading text.
  if (pie.levelLoading) {
    textAlign(CENTER, CENTER);
    text(pie.loadingText, width/2, height/2);
  }
}

public class wall extends GameObject {
  public wall() {super(pie);}
}