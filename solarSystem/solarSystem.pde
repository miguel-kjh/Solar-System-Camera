//import gifAnimation.*;



String pathBackgorund = "data_image/2k_stars_milky_way.jpg";
CameraController camera;
SystemController solarSystem;
KeyController keyController;
PImage bg;
float x,y;
int wordSize   = 30;
int countFrame = 0;
Ship ship;
/*final int maxFrame = 10;
GifMaker gif;*/

void setup(){
  size(900,491, P3D);
  solarSystem = new SystemController();
  keyController = new KeyController();
  solarSystem.loadData();
  bg = loadImage(pathBackgorund);
  fill(255,255,0);
  textAlign(CENTER,CENTER);
  textSize(wordSize);
  x = width/2.0;
  y = height/2.0;
  camera = new CameraController(
    new Point(0,0,y/tan(PI*30.0/180.0)),
    new Point(0,0,0),
    0
    );
  ship = new Ship(0,y,width,y, "data_image/panel.jpg");
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


boolean isException = true;
void draw(){
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
  hint(ENABLE_DEPTH_TEST);
  pushMatrix();
  camera.setCamera();
  translate(x,y,0);
  solarSystem.moveSystem();
  keyController.moveScreen();
  popMatrix();
  hint(DISABLE_DEPTH_TEST);
  ship.createShip();
  //setFrame();
}

void keyPressed(){
  keyController.updateKeysPressed();
}

void keyReleased(){
  keyController.updateKeysReleased();
}

class KeyController{
  private boolean[] keyPosibles;
  
  public KeyController(){
    keyPosibles = new boolean[12];
  }
  
  public void updateKeysPressed(){
      if(key == 'w' || key == 'W'){
        keyPosibles[0] = true; 
      }
      if(key == 's' || key == 'S'){
        keyPosibles[1] = true; 
      }
      if(key == 'a' || key == 'A'){
        keyPosibles[2] = true;
      }
      if(key == 'd' || key == 'D'){
        keyPosibles[3] = true;
      }
      if(keyCode == UP ){
        keyPosibles[4] = true;
      }
      if(keyCode == DOWN ){
        keyPosibles[5] = true;
      }
      if(keyCode == RIGHT ){
        keyPosibles[6] = true;
      }
      if(keyCode == LEFT ){
        keyPosibles[7] = true;
      }
      if(key == 'e' || key == 'E'){
        keyPosibles[8] = true;
      }
      if(key == 'q' || key == 'Q'){
        keyPosibles[9] = true;
      }
      if(key == 'r' || key == 'R'){
        keyPosibles[10] = true;
      }
      if(key == 'f' || key == 'F'){
        keyPosibles[11] = true;
      }
  }
  
  public void updateKeysReleased(){
      if(key == 'w' || key == 'W'){
        keyPosibles[0] = false; 
      }
      if(key == 's' || key == 'S'){
        keyPosibles[1] = false; 

      }
      if(key == 'a' || key == 'A'){
        keyPosibles[2] = false;
      }
      if(key == 'd' || key == 'D'){
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
      if(key == 'e' || key == 'E'){
        keyPosibles[8] = false;
      }
      if(key == 'q' || key == 'Q'){
        keyPosibles[9] = false;
      }
      if(key == 'r' || key == 'R'){
        keyPosibles[10] = false;
      }
      if(key == 'f' || key == 'F'){
        keyPosibles[11] = false;
      }
  }
  
  private int getKeyPressed(){
    for(int i = 0; i < keyPosibles.length; i++){
      if(keyPosibles[i]){
        return i;
      }
    }
    return -1;
  }
  
  public void moveScreen(){
    int index = getKeyPressed();
    switch(index) {
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
    
    
