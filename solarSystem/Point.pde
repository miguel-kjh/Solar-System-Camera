public class Point {
  float x;
  float y;
  float z;
  
  public Point(float x,float y){
    this.x = x;
    this.y = y;
    this.z = 0;
  }
  
  public Point(float x,float y, float z){
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  public void movePointTo(Point newPosition){
    this.x = newPosition.x;
    this.y = newPosition.y;
    this.z = newPosition.z;
  }
  
  public Point getTranslate(Point point){
    return new Point(this.x - point.x,this.y - point.y,this.z - point.z);
  }
  
  @Override
  public String toString(){
    return "[ " + x + "," + y + "," + z + "]";
  }
}
