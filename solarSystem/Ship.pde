public class Ship{
  private PShape rectangle;
  private final float range = 20;
  
  public Ship(float x1,float x2, float y1, float y2, String pathImage){
    rectangle = createShape(RECT,x1,x2+range,y1,y2);
    rectangle.setTexture(loadImage(pathImage));
  }
  
  
   public void createShip(){
     shape(rectangle);
   }
}
