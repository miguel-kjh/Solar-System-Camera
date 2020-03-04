enum Direction{
  NEGATIVE,
  POSITIVE
}

public class CameraController {
  private Point eye;
  private Point center;
  private float cameraAngule;
  private final float increaseEye = 10;
  private float angleX,angleY = 0;
  private float increaseRotate = PI/4;
  private final float increaseAngule = 2;
  
  public CameraController(Point eye, Point center,float cameraAngule){
    this.eye          = eye;
    this.center       = center; 
    this.cameraAngule = cameraAngule;
  }
  
  public void setCamera(){
    camera(x-eye.x, y-eye.y, eye.z, x-center.x, y-center.y, center.z, sin(radians(cameraAngule)), cos(radians(cameraAngule)), 0);
  }
  
  public void moveEyeX(Direction direction){
    if(direction == Direction.NEGATIVE) {
      eye.x -= increaseEye;
    } else {
      eye.x += increaseEye;
    }
  }
  
  public void moveEyeY(Direction direction){
    if(direction == Direction.NEGATIVE) {
      eye.y -= increaseEye;
    } else {
      eye.y += increaseEye;
    }
  }
  
  public void moveCenterX(Direction direction){
    Point point = center.getTranslate(eye);
    if(direction == Direction.NEGATIVE){
      center.x =  point.x*cos(radians(increaseRotate)) + point.z*sin(radians(increaseRotate));
      center.z = -point.x*sin(radians(increaseRotate)) + point.z*cos(radians(increaseRotate));
      angleX -= radians(increaseRotate);
    } else {
      center.x =  point.x*cos(radians(increaseRotate)) - point.z*sin(radians(increaseRotate));
      center.z =  point.x*sin(radians(increaseRotate)) + point.z*cos(radians(increaseRotate));
      angleX += radians(increaseRotate);
    }
    if (angleX > 2*PI || angleX < 0) angleX = 0;
    println("Rotar sobre Y");
    println(angleX);
    println(center);
    
  }
  
  public void moveCenterY(Direction direction){
    Point point = center.getTranslate(eye);
    if(direction == Direction.NEGATIVE) {
      center.y =  point.y*cos(radians(increaseRotate)) + point.z*sin(radians(increaseRotate));
      center.z = -point.y*sin(radians(increaseRotate)) + point.z*cos(radians(increaseRotate));
      angleY -= radians(increaseRotate);
    } else {
      center.y =  point.y*cos(radians(increaseRotate)) - point.z*sin(radians(increaseRotate));
      center.z =  point.y*sin(radians(increaseRotate)) + point.z*cos(radians(increaseRotate));
      angleY += radians(increaseRotate);
    }
    if (angleY > 2*PI || angleY < 0) angleY = 0;
    println("Rotar sobre X");
    println(angleY);
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
  }
  
  public void moveZoom(Direction direction){
    if(direction == Direction.NEGATIVE) {
      eye.z -= increaseEye;
    } else {
      eye.z += increaseEye;
    }
  }
  
}
