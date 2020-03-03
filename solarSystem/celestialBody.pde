public abstract class CelestialBody{
  
  private float turningSpeed,speedIncrease;
  private String name;
  private PShape pshape;
  private int dimension;
  
  public CelestialBody(int dimension, float turningSpeed,float speedIncrease, String name, String pathImage){
    this.turningSpeed = turningSpeed;
    this.speedIncrease = speedIncrease;
    this.name = name;
    this.dimension = dimension;
    noStroke();
    pshape = createShape(SPHERE, dimension);
    pshape.setTexture(loadImage(pathImage));
  }
  
  protected void calculateSpeed(){
    turningSpeed += speedIncrease;
    if(turningSpeed >= 360) turningSpeed = 0;
  }
  
  public abstract void move();
  
}
