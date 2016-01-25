public class character extends gameObject {
  public character() {super(pie);}
  
  int horzSpeed = 5;
  int vertSpeed = 5;
  int up, down, left, right = 0;
  
  public void init() {
    
    // Set initial sprite.
    setSprite("walk_down");
  }
  
  public void update() { 
    
    // Camera control.
    pie.cameraX = x - (width/pie.pixelSize)/2;
    pie.cameraY = y - (height/pie.pixelSize)/2;
    
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
  
  public void colPredict() {
    
    // If colliding next frame with wall...
    if (otherPredict.type == "wall") {
      
      // Check if it's a horizontal collision.
      if (PixelPie.objHorzCollision(this, otherPredict)) {
        
        // If we're not already pressing up against it.
        if (PixelPie.horzDist(this, otherPredict) != 0) {
        
          // Adjust xSpeed so we land just on the surface of the wall.
          xSpeed = PixelPie.horzDist(this, otherPredict);
          
        // If we actually are pressing up against it.
        } else {
          
          // Stop horizontal movement.
          xSpeed = 0;
        }
        
      // Else, if it is a vertical collision.
      } else if (PixelPie.objVertCollision(this, otherPredict)){
        
        // Adjust ySpeed so we land just on teh surface of the wall.
        ySpeed = PixelPie.vertDist(this, otherPredict);
      }
    }
  }
  
  public void collide() {
    if (other.type == "wall") {
      if ((pie.left(other) == right(this)) && xSpeed > 0) {xSpeed = 0;}
      if ((right(other) == left(this)) && xSpeed < 0) {xSpeed = 0;}
      if ((top(other) == bottom(this)) && ySpeed > 0) {ySpeed = 0;}
      if ((bottom(other) == top(this)) && ySpeed < 0) {ySpeed = 0;}
    }
  }
}