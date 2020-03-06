public class Ship{
  private PShape rectangle;
  private final float range = 100;
  
  public Ship(float x1,float x2, float y1, float y2, String pathImage){
    fill(255,255,255);
    rectangle = createShape(RECT,x1,x2+range,y1,y2);
    fill(255,255,0);
    rectangle.setTexture(loadImage(pathImage));
  }
  
  
   public void createShip(){
     textSize(wordSize/2);
     fill(255,255,255);
     text("A,D,R,F move the ship in X,Y",x*0.24,y*0.05);
     text("W,S move the ship in Z",x*0.185,y*0.15);
     text("P,O rotate the camera",x*0.18,y*0.25);
     text("keyArrow for rotate on the shaft",x*0.265,y*0.35);
     shape(rectangle);
     textSize(wordSize);
     fill(255,255,0);
   }
}
