public class Planet extends CelestialBody{
  private ArrayList<Satellite> listOfSatellite;
  private float distance;
  
  public Planet(int dimension, float turningSpeed,float speedIncrease,float distance, String name, String pathImage){
    super(dimension,turningSpeed,speedIncrease,name,pathImage);
    listOfSatellite = new ArrayList();
    this.distance = distance;
  }
  
  public void add(Satellite satellite){
    listOfSatellite.add(satellite);
  }
  
  @Override
  public void move(){
    pushMatrix();
    rotateY(radians(super.turningSpeed));
    translate(distance,0,0);
    text(super.name,0,-super.dimension*2);
    shape(super.pshape);
    for(Satellite satellite:listOfSatellite){
      satellite.move();
    }
    popMatrix();
    super.calculateSpeed();
  }
}
