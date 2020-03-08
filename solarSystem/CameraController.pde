enum Direction{
  NEGATIVE,
  POSITIVE
}

public class CameraController {
  private PVector eye, initialEye;
  private PVector center,initialCenter;
  private PVector cameraUp,initialCameraUp;
  private float yaw,pitch;
  
  private final float initialYaw     = -90;
  private final float initialPitch   = 0;
  private final float speed          = 0.05;
  private final float increaseAngule = 2;
  
  public CameraController(PVector eye, PVector center,PVector cameraUp){
    this.eye             = eye;
    this.initialEye      = eye.copy();
    this.center          = center;
    this.initialCenter   = center.copy();
    this.cameraUp        = cameraUp;
    this.initialCameraUp = cameraUp.copy();
    this.yaw             = initialYaw;
    this.pitch           = initialPitch;
  }
  
  public void setCamera(){
    camera(eye.x, eye.y, eye.z, eye.x+center.x, eye.y+center.y, eye.z+center.z, cameraUp.x, cameraUp.y, cameraUp.z);
  }
  
  public void moveEyeX(Direction direction){
    PVector aux = center.cross(cameraUp).normalize().mult(speed);
    if(direction == Direction.NEGATIVE) {
      eye.x -= aux.x;
      eye.y -= aux.y;
      eye.z -= aux.z;
    } else {
      eye.x += aux.x;
      eye.y += aux.y;
      eye.z += aux.z;
    }
    println("moveEyeX");
    println(eye);
    println(center);
  }
  
  public void moveEyeY(Direction direction){
    /*if(direction == Direction.NEGATIVE) {
      eye.y    -= increaseEye;
      center.y -= increaseEye;
    } else {
      eye.y    += increaseEye;
      center.y += increaseEye;
    }
    println("moveEyeY");
    println(eye);
    println(center);*/
  }
  
  private void updateDirectorVector(){
    center.x = cos(radians(yaw)) * cos(radians(pitch));
    center.y = sin(radians(pitch));
    center.z = sin(radians(yaw)) * cos(radians(pitch));
    center.normalize();
  }
  
  public void moveCenterX(Direction direction){
    if(direction == Direction.NEGATIVE){
      yaw += 2;
      /*center.x =  point.x*cos(radians(increaseRotate)) + point.z*sin(radians(increaseRotate));
      center.z = -point.x*sin(radians(increaseRotate)) + point.z*cos(radians(increaseRotate));*/
    } else {
      yaw -= 2;
      /*center.x =  point.x*cos(radians(increaseRotate)) - point.z*sin(radians(increaseRotate));
      center.z =  point.x*sin(radians(increaseRotate)) + point.z*cos(radians(increaseRotate));*/
    }
    updateDirectorVector();
    println("Rotar sobre Y");
    println(eye);
    println(center);
    
    
  }
  
  /*public void moveCenter(){
    if(center.x >= -width/2){
      center.z -= 10;
      center.x -= mouseX - pmouseX;
      center.y += mouseY - pmouseY;
      return;
    }
    
    if(center.x <= -width/2){
      center.z += 10;
      center.x += mouseX - pmouseX;
      center.y += mouseY - pmouseY;
      return;
    }
    center.x += mouseX - pmouseX;
    center.y += mouseY - pmouseY;
    println(eye);
    println(center);
  }*/
  
  public void moveCenterY(Direction direction){
    /*Point point = center.getTranslate(eye);
    if(direction == Direction.NEGATIVE) {
      center.y =  point.y*cos(radians(increaseRotate)) + point.z*sin(radians(increaseRotate));
      center.z = -point.y*sin(radians(increaseRotate)) + point.z*cos(radians(increaseRotate));
    } else {
      center.y = point.y*cos(radians(increaseRotate))  - point.z*sin(radians(increaseRotate));
      center.z = point.y*sin(radians(increaseRotate))  + point.z*cos(radians(increaseRotate));
    }*/
    if(direction == Direction.NEGATIVE){
      pitch += 2;
      /*center.x =  point.x*cos(radians(increaseRotate)) + point.z*sin(radians(increaseRotate));
      center.z = -point.x*sin(radians(increaseRotate)) + point.z*cos(radians(increaseRotate));*/
    } else {
      pitch -= 2;
      /*center.x =  point.x*cos(radians(increaseRotate)) - point.z*sin(radians(increaseRotate));
      center.z =  point.x*sin(radians(increaseRotate)) + point.z*cos(radians(increaseRotate));*/
    }
    if (pitch > 89.0f) pitch = 89.0f;
    if (pitch < -89.0f) pitch = -89.0f;
    updateDirectorVector();
    println("Rotar sobre X");
    println(eye);
    println(center);
  }
  
  public void moveAngule(Direction direction){
    /*if(direction == Direction.NEGATIVE) {
      cameraAngule -= increaseAngule;
      if(abs(cameraAngule) >= 360) cameraAngule = 0;
    } else {
      cameraAngule += increaseAngule;
      if(cameraAngule >= 360) cameraAngule = 0;
    }
    println("Rotate angule");
    println(cameraAngule);*/
  }
  
  public void moveZoom(Direction direction){
    if(direction == Direction.NEGATIVE) {
      PVector multiple = center.mult(speed);
      eye.x -= multiple.x;
      eye.y -= multiple.y;
      eye.z -= multiple.z;
    } else {
      PVector multiple = center.mult(speed);
      eye.x += multiple.x;
      eye.y += multiple.y;
      eye.z += multiple.z;
    }
    println("move Zoom");
    println(eye);
    println(center);
  }
  
  public void resetCamera(){
    
    yaw     = initialYaw;
    pitch   = initialPitch;
    
    cameraUp.set(initialCameraUp.x,initialCameraUp.y,initialCameraUp.z);
    center.set(initialCenter.x,initialCenter.y,initialCenter.z);
    eye.set(initialEye.x,initialEye.y,initialEye.z);
  }
  
}
