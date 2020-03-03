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
  
  public Point getTranslate(Point point){
    return new Point(x - point.x,y - point.y,z - point.z);
  }
  
  @Override
  public String toString(){
    return "[ " + x + "," + y + "," + z + "]";
  }
}
