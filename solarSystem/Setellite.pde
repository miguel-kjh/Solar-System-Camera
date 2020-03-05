public class Satellite extends CelestialBody{
   
  private float distance;
  
  public Satellite(int dimension, float turningSpeed,float speedIncrease,float distance, String name,String pathImage){
    super(dimension,turningSpeed,speedIncrease,name,pathImage);
    this.distance = distance;
  }
  
  
  @Override
  public void move(){
    pushMatrix();
    rotateY(radians(super.turningSpeed));
    translate(distance,0,0);
    rotateY(radians(super.turningSpeed));
    text(super.name,0,-super.dimension*2);
    shape(super.pshape);
    popMatrix();
    super.calculateSpeed();
  }
}
