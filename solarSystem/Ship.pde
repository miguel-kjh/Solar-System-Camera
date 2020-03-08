public class Ship{
  private PShape rectangle;
  private final float range = 112;
  
  public Ship(float x1,float x2, float y1, float y2, String pathImage){
    fill(255,255,255);
    rectangle = createShape(RECT,x1,x2+range,y1,y2);
    fill(255,255,0);
    rectangle.setTexture(loadImage(pathImage));
  }
  
  
   public void createShip(){
     textSize(wordSize/2);
     fill(255,255,255);
     text("A,D,W,S move the ship",x*0.19,y*0.05);
     text("P,O rotate the camera",x*0.18,y*0.15);
     text("keyArrow for rotate on the shaft",x*0.265,y*0.25);
     text("F to reset",x*0.08,y*0.35);
     text("Enter back to menu",x*0.16,y*0.45);
     shape(rectangle);
     textSize(wordSize);
     fill(255,255,0);
   }
}
