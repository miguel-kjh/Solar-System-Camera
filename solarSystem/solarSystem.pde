//import gifAnimation.*;


float anguleX         = 0;
float anguleY         = 0;
float px              = 0;
float py              = 0;
String pathBackgorund = "data_image/2k_stars_milky_way.jpg";

SystemController solarSystem;
KeyController keyController;
PImage bg;
float x,y;
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
  fill(255,255,0);
  textAlign(CENTER,CENTER);
  textSize(wordSize);
  x = height/2.0;
  y = width/2.0;
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
  camera(x-anguleX, y-anguleY, y / tan(PI*30.0 / 180.0), x-px, y-py, 0, 0, 1, 0);
  translate(x,y,0);
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


class KeyController{
  private final int moveAxes = 10;
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
        anguleX += moveAxes;
        break;
      case 1:
        anguleX -= moveAxes;
        break;
      case 2:
        anguleY -= moveAxes;
        break;
      case 3:
        anguleY += moveAxes;
        break;
      case 4:
        py += moveAxes;
        break;
      case 5:
        py -= moveAxes;
        break;
      case 6:
        px += moveAxes; 
        break;
      case 7:
        px -= moveAxes;
        break;  
      default:
        break;
    }
  }
  
}
    
    
