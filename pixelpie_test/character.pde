public class character extends gameObject {
  public character() {super(pie);}
  
  int horzSpeed = 5;
  int vertSpeed = 5;
  int up, down, left, right = 0;
  
  public void init() {
    
    // Set some parameters.
    setSprite("walk_down");
  }
  
  public void update() {
    
    // Movement control.
    xSpeed = horzSpeed * (left + right);
    ySpeed = vertSpeed * (up + down);
    
    // Animation control.
    if (ySpeed == 0) {
      if (xSpeed > 0) {
        setSprite("walk_right");
      } else if (xSpeed < 0) {
        setSprite("walk_left");
      } else {
        setSprite("walk_down");
      }
    } else if (ySpeed > 0) {
      setSprite("walk_down");
    } else {
      setSprite("walk_up");
    }

    // Center camera on character.
    pie.displayX = x - (width/pie.pixelSize)/2;
    pie.displayY = y - (height/pie.pixelSize)/2;
  }
  
  public void keyPressed() {
    
    // Key presses.
    switch (key) {
      case 'w':
        up = -1;
        break;
        
      case 'a':
        left = -1;
        break;
        
      case 's':
        down = 1;
        break;
        
      case 'd':
        right = 1;
        break;
    }
  }
  
  public void keyReleased() {
    
    // Key releases.
    switch (key) {      
      case 'w':
        up = 0;
        break;
        
      case 'a':
        left = 0;
        break;
        
      case 's':
        down = 0;
        break;
        
      case 'd':
        right = 0;
        break;
    }
  }
  
  // If we're going to collide with object "otherPredict" next frame.
  public void colPredict() {
    
    // If we're not already colliding.
    if (!PixelPie.objCollision(this, otherPredict)) {
      
      // If impending collision is from top/bottom.
      if (PixelPie.objHorzCollision(this, otherPredict)) {
        
        // Snap to the surface of the colliding object and remove all vertical speed.
        y += PixelPie.vertDist(this, otherPredict);
        ySpeed = 0;
        
      // Else, if impending collision is from left/right.
      } else {
        
        // Snap to the surface of the colliding object and remove all horizontal speed.
        x += PixelPie.horzDist(this, otherPredict);
        xSpeed = 0;
      }
    }
  }
  
  // If we're already colliding with something.
  public void collide() {
    
    // Since we already made sure to snap to surfaces of objects we're predicted to collide with in colPredict(),
    // We just have to deal with stopping the character from moving further into objects they are pressing up against.
    
    if (PixelPie.left(this) == PixelPie.right(other)) {xSpeed = constrain(xSpeed, 0, horzSpeed);}
    if (PixelPie.right(this) == PixelPie.left(other)) {xSpeed = constrain(xSpeed, -1 * horzSpeed, 0);}
    if (PixelPie.top(this) == PixelPie.btm(other)) {ySpeed = constrain(ySpeed, 0, vertSpeed);}
    if (PixelPie.btm(this) == PixelPie.top(other)) {ySpeed = constrain(ySpeed, -1 * vertSpeed, 0);}
  }
}