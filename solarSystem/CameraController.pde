enum Direction{
  NEGATIVE,
  POSITIVE
}

public class CameraController {
  private Point eye, initialEye;
  private Point center,initialCenter;
  private float cameraAngule,initialAngule;
  private final float increaseEye = 10;
  private final float increaseRotate = 2;
  private final float increaseAngule = 2;
  
  public CameraController(Point eye, Point center,float cameraAngule){
    this.eye           = eye;
    this.initialEye    = eye.clone();
    this.center        = center;
    this.initialCenter = center.clone();
    this.cameraAngule  = cameraAngule;
    this.initialAngule = cameraAngule;
  }
  
  public void setCamera(){
    camera(x-eye.x, y-eye.y, eye.z, x-center.x, y-center.y, center.z, sin(radians(cameraAngule)), cos(radians(cameraAngule)), 0);
  }
  
  public void moveEyeX(Direction direction){
    if(direction == Direction.NEGATIVE) {
      eye.x    -= increaseEye;
      center.x -= increaseEye;
    } else {
      eye.x    += increaseEye;
      center.x += increaseEye;
    }
    println("moveEyeX");
    println(eye);
    println(center);
  }
  
  public void moveEyeY(Direction direction){
    if(direction == Direction.NEGATIVE) {
      eye.y    -= increaseEye;
      center.y -= increaseEye;
    } else {
      eye.y    += increaseEye;
      center.y += increaseEye;
    }
    println("moveEyeY");
    println(eye);
    println(center);
  }
  
  public void moveCenterX(Direction direction){
    Point point = center.getTranslate(eye);
    if(direction == Direction.NEGATIVE){
      center.x =  point.x*cos(radians(increaseRotate)) + point.z*sin(radians(increaseRotate));
      center.z = -point.x*sin(radians(increaseRotate)) + point.z*cos(radians(increaseRotate));
    } else {
      center.x =  point.x*cos(radians(increaseRotate)) - point.z*sin(radians(increaseRotate));
      center.z =  point.x*sin(radians(increaseRotate)) + point.z*cos(radians(increaseRotate));
    }
    center.x += eye.x;
    center.z += eye.z;
    center.y += eye.y;
    println("Rotar sobre Y");
    println(eye);
    println(center);
    
    
  }
  
  public void moveCenterY(Direction direction){
    Point point = center.getTranslate(eye);
    if(direction == Direction.NEGATIVE) {
      center.y =  point.y*cos(radians(increaseRotate)) + point.z*sin(radians(increaseRotate));
      center.z = -point.y*sin(radians(increaseRotate)) + point.z*cos(radians(increaseRotate));
    } else {
      center.y = point.y*cos(radians(increaseRotate))  - point.z*sin(radians(increaseRotate));
      center.z = point.y*sin(radians(increaseRotate))  + point.z*cos(radians(increaseRotate));
    }
    //center.y += eye.y;
    //center.z += eye.z;
    println("Rotar sobre X");
    println(eye);
    println(center);
  }
  
  public void moveAngule(Direction direction){
    if(direction == Direction.NEGATIVE) {
      cameraAngule -= increaseAngule;
      if(abs(cameraAngule) >= 360) cameraAngule = 0;
    } else {
      cameraAngule += increaseAngule;
      if(cameraAngule >= 360) cameraAngule = 0;
    }
    println("Rotate angule");
    println(cameraAngule);
  }
  
  public void moveZoom(Direction direction){
    if(direction == Direction.NEGATIVE) {
      eye.z    -= increaseEye;
      center.z -= increaseEye;
    } else {
      eye.z    += increaseEye;
      center.z += increaseEye;
    }
    println("move Zoom");
    println(eye);
    println(center);
  }
  
  public void resetCamera(){
    eye.movePointTo(initialEye);
    center.movePointTo(initialCenter);
    cameraAngule = initialAngule;
  }
  
}
