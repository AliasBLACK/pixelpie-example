public class exit extends gameObject {
  public exit() {super(pie);}
  
  String nextLevel;
  
  public void init() {
    nextLevel = PixelPie.getParam("level", this);
  }
  
  public void collide() {
    if ((other.type == "character") && (nextLevel != null)) {
      pie.loadLevel(nextLevel);
    }
  }
}