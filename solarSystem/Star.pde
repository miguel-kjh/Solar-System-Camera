public class Star extends CelestialBody{
  
  private ArrayList<Planet> listOfPlanets;
  
  public Star(int dimension, float turningSpeed,float speedIncrease, String name, String pathImage){
    super(dimension,turningSpeed,speedIncrease,name,pathImage);
    listOfPlanets = new ArrayList();
  }
  
  public void add(Planet planet){
    listOfPlanets.add(planet);
  }
  
  @Override
  public void move(){
    pushMatrix();
    rotateY(radians(super.turningSpeed));
    text(super.name,0,-super.dimension*2);
    shape(super.pshape);
    popMatrix();
    for(Planet planet:listOfPlanets){
      planet.move();
    }
    super.calculateSpeed();
  }
}
