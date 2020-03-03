public class SystemController{
  
  Star star;
  
  public SystemController(){
    star = new Star(100,0.25,0.25,"Sun","data_image/2k_sun.jpg");
  }
  
  public void loadData(){
    star.add(
      new Planet(50,0,0.65,-width*0.25,"Mercury", "data_image/2k_mercury.jpg")
    );
    
    star.add(
      new Planet(50,0,0.55,-width*0.45,"Venus", "data_image/2k_venus_atmosphere.jpg")
    );
    
    Planet earth = new Planet(45,0,0.4,-width*0.65,"Earth","data_image/2k_earth_daymap.jpg");
    earth.add(new Satellite(10,0.35,0.7,80,"Moon", "data_image/2k_moon.jpg"));
    star.add(earth);
    
    star.add(
      new Planet(50,0,0.3,-width*.80,"Mars", "data_image/2k_mars.jpg")
    );
    
    Planet jupiter = new Planet(90,0,0.25,-width,"Jupiter", "data_image/2k_jupiter.jpg");
    jupiter.add(
      new Satellite(25,0.2,0.2,130,"Titan", "data_image/2k_titan.jpg")
    );
    star.add(jupiter);
    
    Planet Saturn = new Planet(85,0,0.2,-width*1.5,"Saturn", "data_image/2k_saturn.jpg");
    Saturn.add(
      new Satellite(25,0.2,0.2,130,"Calisto", "data_image/2k_calisto.jpg")
    );
    
    star.add(Saturn);
    
    star.add(
      new Planet(52,0,0.10,-width*2,"Uranus", "data_image/2k_uranus.jpg")
    );
    
    star.add(
      new Planet(51,0,0.05,-width*2.5,"Neptune", "data_image/2k_neptune.jpg")
    );
    
    star.add(
      new Planet(51,0,0.03,-width*2.65,"Pluto", "data_image/2k_pluton.jpg")
    );
    
  }
  
  public void moveSystem(){
    star.move();
  }
    
  
}
