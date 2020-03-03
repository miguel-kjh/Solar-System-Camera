//import gifAnimation.*;


float z               = 0;
float anguleX         = -45;
float anguleY         = 0;
String pathBackgorund = "data_image/2k_stars_milky_way.jpg";

SystemController solarSystem;
KeyController keyController;
float x;
float y;
PImage bg;
int wordSize = 30;
int countFrame = 0;
/*final int maxFrame = 10;
GifMaker gif;*/

void setup(){
  size(900,491, P3D);
  solarSystem = new SystemController();
  keyController = new KeyController();
  solarSystem.loadData();
  bg = loadImage(pathBackgorund);
  x  = width/2;
  y  = height/2;
  fill(255,255,0);
  textAlign(CENTER,CENTER);
  textSize(wordSize);
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
  translate(x,y,z);
  rotateX(radians(anguleX));
  rotateY(radians(anguleY));
  solarSystem.moveSystem();
  keyController.moveScreen();
  //setFrame();
}

void keyPressed(){
  keyController.updateKeysPressed();
}

void keyReleased(){
  keyController.updateKeysReleased();
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  int zoom = 100;
  if(e < 0){
    z += zoom;
  } else {
    z -= zoom;
  }  
}


class KeyController{
  private final int zoom = 15;
  private final int moveAxes = 2;
  private boolean[] keyPosibles;
  
  public KeyController(){
    keyPosibles = new boolean[8];
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
      
      if(key == 'r' || key == 'R'){
        x = width/2;
        y = height/2;
      }
      if(key == 'f' || key == 'F'){
        anguleX = -45;
        anguleY = 0;
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
        y += zoom;
        break;
      case 1:
        y -= zoom;
        break;
      case 2:
        x += zoom;
        break;
      case 3:
        x -= zoom;
        break;
      case 4:
        anguleX -= moveAxes;
        break;
      case 5:
        anguleX += moveAxes;
        break;
      case 6:
        anguleY += moveAxes;
        break;
      case 7:
        anguleY -= moveAxes;
        break;
      default:
        break;
    }
  }
  
}
    
    
