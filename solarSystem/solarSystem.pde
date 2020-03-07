//import gifAnimation.*;
String pathBackgorund;
boolean isException;
CameraController camera;
SystemController solarSystem;
KeyController keyController;
PImage bg;
float x,y;
int wordSize   = 30;
int countFrame = 0;
Ship ship;
Mode mode;
/*final int maxFrame = 10;
GifMaker gif;*/

void setup(){
  size(900,491, P3D);
  solarSystem = new SystemController();
  pathBackgorund = "data_image/2k_stars_milky_way.jpg";
  keyController = new KeyController();
  solarSystem.loadData();
  bg = loadImage(pathBackgorund);
  fill(255,255,0);
  textAlign(CENTER,CENTER);
  textSize(wordSize);
  x = width/2.0;
  y = height/2.0;
  isException = true;
  camera = new CameraController(
    new Point(0,0,y/tan(PI*30.0/180.0)),
    new Point(0,0,0),
    0
    );
  ship = new Ship(0,y,width,y, "data_image/panel.jpg");
  mode = new Mode();
  /*gif = new GifMaker(this,"animation.gif");
  gif.setRepeat(0);*/
}

/*void setFrame(){
  if(countFrame == maxFrame){
      gif.addFrame();
      countFrame = 0;
  }
  countFrame++;
}*/


void draw(){
  controlMonitorException();
  hint(ENABLE_DEPTH_TEST);
  pushMatrix();
  mode.moveCamera();
  translate(x,y,-300);
  solarSystem.moveSystem();
  keyController.moveScreen();
  popMatrix();
  hint(DISABLE_DEPTH_TEST);
  mode.paintOverShape();
  //setFrame();
}

void controlMonitorException(){
  try{
    background(bg);
  }catch(RuntimeException e){
    background(0);
    if(isException){
      println("############### ERROR ##################");
      println(e);
      println("the background image is not loaded due to the size of your monitor");
      isException = false;
      println("############### ERROR ##################");
    }
  }
}

void keyPressed(){
  keyController.updateKeysPressed();
}

void keyReleased(){
  keyController.updateKeysReleased();
}

class Mode{
  private boolean isCameraMode;
  private int countFrame = 0;
  private int maxCountFrame = 100;
  private int rangeY = 150;
  private boolean blinker;
  
  public Mode(){
    isCameraMode = false;
    blinker      = true;
  }
  
  public void ChangeMode(){
    camera.resetCamera();
    isCameraMode = !isCameraMode;
  }
  
  public void moveCamera(){
    if(isCameraMode){
      camera.setCamera();
    }
  }
  
  public boolean isCameraActivated(){
    return isCameraMode;
  }
  
  public void paintOverShape(){
    if(isCameraMode){
      ship.createShip();
    } else {
      if(countFrame >= maxCountFrame){
        countFrame = 0;
        blinker = !blinker;
      }
      if(blinker){
        text("PRESS ENTER TO SWITCH TO NAVIGATION MODE",x,y+rangeY);
      }
      countFrame++;
    }
  }
  
}

class KeyController{
  private boolean[] keyPosibles;
  
  public KeyController(){
    keyPosibles = new boolean[12];
  }
  
  public void updateKeysPressed(){
      if(mode.isCameraActivated() && (key == 'a' || key == 'A')){
        keyPosibles[0] = true; 
      }
      if(mode.isCameraActivated() && (key == 'd' || key == 'D')){
        keyPosibles[1] = true; 
      }
      if(mode.isCameraActivated() && (key == 'r' || key == 'R')){
        keyPosibles[2] = true;
      }
      if(mode.isCameraActivated() && (key == 'f' || key == 'F')){
        keyPosibles[3] = true;
      }
      if(mode.isCameraActivated() && keyCode == UP ){
        keyPosibles[4] = true;
      }
      if(mode.isCameraActivated() && keyCode == DOWN ){
        keyPosibles[5] = true;
      }
      if(mode.isCameraActivated() && keyCode == RIGHT ){
        keyPosibles[6] = true;
      }
      if(mode.isCameraActivated() && keyCode == LEFT ){
        keyPosibles[7] = true;
      }
      if(mode.isCameraActivated() && (key == 'o' || key == 'O')){
        keyPosibles[8] = true;
      }
      if(mode.isCameraActivated() && (key == 'p' || key == 'P')){
        keyPosibles[9] = true;
      }
      if(mode.isCameraActivated() && (key == 'w' || key == 'W')){
        keyPosibles[10] = true;
      }
      if(mode.isCameraActivated() && (key == 's' || key == 'S')){
        keyPosibles[11] = true;
      }
      if( keyCode == ENTER){
        mode.ChangeMode();
      }
  }
  
  public void updateKeysReleased(){
      if(!mode.isCameraActivated()){
        return;
      }
      if(key == 'a' || key == 'A'){
        keyPosibles[0] = false; 
      }
      if(key == 'd' || key == 'D'){
        keyPosibles[1] = false; 

      }
      if(key == 'r' || key == 'R'){
        keyPosibles[2] = false;
      }
      if(key == 'f' || key == 'F'){
        keyPosibles[3] = false;
      }
      if(keyCode == UP ){
        keyPosibles[4] = false;
      }
      if(keyCode == DOWN ){
        keyPosibles[5] = false;
      }
      if(keyCode == RIGHT ){
        keyPosibles[6] = false;
      }
      if(keyCode == LEFT ){
        keyPosibles[7] = false;
      }
      if(key == 'o' || key == 'O'){
        keyPosibles[8] = false;
      }
      if(key == 'p' || key == 'P'){
        keyPosibles[9] = false;
      }
      if(key == 'w' || key == 'W'){
        keyPosibles[10] = false;
      }
      if(key == 's' || key == 'S'){
        keyPosibles[11] = false;
      }
  }
  
  public void moveScreen(){
    for(int i = 0; i < keyPosibles.length; i++){
          if(!keyPosibles[i]) continue;
          switch(i) {
            case 0:
              camera.moveEyeX(Direction.POSITIVE);
              break;
            case 1:
              camera.moveEyeX(Direction.NEGATIVE);
              break;
            case 2:
              camera.moveEyeY(Direction.POSITIVE);
              break;
            case 3:
              camera.moveEyeY(Direction.NEGATIVE);
              break;
            case 4:
              camera.moveCenterY(Direction.POSITIVE);
              break;
            case 5:
              camera.moveCenterY(Direction.NEGATIVE);
              break;
            case 6:
              camera.moveCenterX(Direction.NEGATIVE); 
              break;
            case 7:
              camera.moveCenterX(Direction.POSITIVE);
              break;
            case 8:
              camera.moveAngule(Direction.POSITIVE);
              break; 
            case 9:
              camera.moveAngule(Direction.NEGATIVE);
              break;
            case 10:
              camera.moveZoom(Direction.NEGATIVE);
              break;
            case 11:
              camera.moveZoom(Direction.POSITIVE);
              break;
            default:
              break;
          }
    }
  }
  
}
    
    
