# Solar-System-Camera
![Version](https://img.shields.io/badge/version-1.0-green)

## Autor
Miguel Ángel Medina Ramírez <br>
Correo: miguel.medina108@alu.ulpgc.es

## Índice
1. [Introducción](#introducción)
2. [Demostración](#demostración)
3. [Dependencias](#dependencias)
4. [Implementación](#implementación)<br>
 4.1. [Diseño de clases](#diseño-de-clases)<br>
 4.2. [Transformaciones y rotación](#transformaciones-y-rotación)<br>
 4.3. [Modelo de camara](#modelo-de-camara)<br>
 4.4. [Ocultación](#ocultación)<br>
5. [Eventos y Controles](#eventos-y-controles)
6. [Bibliografía](#bibliografía)

## Introducción
Esta práctica consiste en diseñar un modelo de cámara para el sistema planetario de la práctica anterior. Se ha optado por diseñar una **vista en primera persona** simulando la navegación de una nave espacial.

## Demostración
<p align="center"> 
   <img src="data/animation.gif" alt="animation"></img>
   <p align="center">Figura 1: Gif de demostración</p>
</p>

## Dependencias
Para poder ejecutar y probar la práctica solamente se necesita clonar este repositorio y el editor de processing con la siguiente dependencia:
- La librería **GifAnimation** para poder reproducir y guardar gifs. Como esta librería no forma parte necesaria para la correcta implementación de la práctica, en el código toda la lógica relacionada con ella se encuentra comentada, además de que afecta al rendimiento de la aplicación.En este [enlace](https://github.com/extrapixel/gif-animation) se encuentra la forma de instalarla.

## Implementación
Se ha empleado el patrón de diseño **Composite** para implementar la relaciones entre los astros planetarios.Además se han añadido un nuevo controlador para la lógica de la camara y la clase *Point* para  ayudar al movimiento de la misma.

### Diseño de clases
<p align="center"> 
   <img src="data/diagrama.png" alt="diagrama"></img>
   <p align="center">Figura 2: Diagrama de clases</p>
</p>

### Transformaciones y rotación

El método *move* es el encargado de implementar la lógica necesaria para representar los astros, además de haceros girar y moverse. Se han usado las primitivas básicas de processing como *pushMatrix*, *popMatrix*, *rotate* y *translate* para implementar el movimiento y rotación simulando el comportamiento de los planetas.

Para las estrellas:

```java
  @Override
  public void move(){
    pushMatrix();
    rotateY(radians(super.turningSpeed));
    text(super.name,0,-super.dimension*2);
    shape(super.pshape);
    popMatrix();
    for(Planet planet:listOfPlanets){
      planet.move();
    }
    super.calculateSpeed();
  }
```

Para los planetas:

```java
  @Override
  public void move(){
    pushMatrix();
    rotateY(radians(super.turningSpeed));
    translate(distance,0,0);
    rotateY(radians(super.turningSpeed));
    text(super.name,0,-super.dimension*2);
    shape(super.pshape);
    for(Satellite satellite:listOfSatellite){
      satellite.move();
    }
    popMatrix();
    super.calculateSpeed();
  }
```

Para los satélites:

```java
  @Override
  public void move(){
    pushMatrix();
    rotateY(radians(super.turningSpeed));
    translate(distance,0,0);
    rotateY(radians(super.turningSpeed));
    text(super.name,0,-super.dimension*2);
    shape(super.pshape);
    popMatrix();
    super.calculateSpeed();
  }
```
## Modelo de camara
El modelo que se busca para la nave es tener una camara en **primera persona**, para ello el método *camera* nos ofrece tres puntos para controlar:

 * eye: Coordenadas para controlar la posición del ojo con respecto al sistema observable.
 * center: Coordedas que represetan al observador.
 * up: El vector vértical se usa para inducir un ángulo de inclinación a la camara.
 
Para tener un modelo de primera persona lo que se petendre es que el punto observable se mueva cada vez que se mueva el ojo  teniendo un efecto de movimiento continuo lo más natural posible.Por tanto, es necesario definir tres vectores para cada una de las componenetes y operar con ellas segun lo que el usuario quiere hacer.

### Movimiento
La idea de tener una camara en tercera persona es para disponer de un camara totalmente liberada y con un movimiento fluido para ello se han de modificar el vector *eye* segun una serie de operaciones y una determinada velocidad asocidad a la nave:

 1. Si se quiere ir hacia delante o hacia atrás:
 ```java
    PVector aux = new PVector(center.x*speed, center.y*speed, center.z*speed);
    if(direction == Direction.NEGATIVE) {
      eye.x += aux.x;
      eye.y += aux.y;
      eye.z += aux.z;
    } else {
      eye.x -= aux.x;
      eye.y -= aux.y;
      eye.z -= aux.z;
    }
 ```
 
 2.Si se quiere ir hacia los laterales:
 ```java
    PVector aux = center.cross(cameraUp).normalize().mult(speed);
    if(direction == Direction.NEGATIVE) {
      eye.x += aux.x;
      eye.y += aux.y;
      eye.z += aux.z;
    } else {
      eye.x -= aux.x;
      eye.y -= aux.y;
      eye.z -= aux.z;
    }
 ```

### Rotaciones
Para mirar alrededor de la escena, tenemos que cambiar el vector *center*. Sin embargo, cambiar el vector de dirección basado en las rotaciones del mouse es un poco complicado y requiere algo de trigonemetría. 

#### Ángulos de Euler
Los ángulos de Euler son 3 valores que pueden representar cualquier rotación en 3D. Hay 3 ángulos de Euler: *pitch*, *yaw* y *roll* . La siguiente imagen les da un significado visual:

<p align="center"> 
   <img src="data/euler_ang.png" alt="Ángulos de Euler"></img>
   <p align="center">Figura 3: Ángulos de Euler</p>
</p>

*Pitch* es el ángulo que representa cuánto estamos mirando hacia arriba o hacia abajo. El *yaw* representa cuánto estamos mirando hacia la izquierda o hacia la derecha. El *roll* resenta el angulo de giro.

Cada uno de los ángulos de Euler está representado por un solo valor y con la combinación de los 3 podemos calcular cualquier vector de rotación en 3D, modificando los angulos según nuestras necesidades podemos implementar un modelo de camara que rote sobre si misma:

```java
  private void updateDirectorVector(){
    center.x = cos(radians(yaw)) * cos(radians(pitch));
    center.y = sin(radians(pitch));
    center.z = sin(radians(yaw)) * cos(radians(pitch));
    center.normalize();
  }
  
  public void moveCenterX(Direction direction){
    if(direction == Direction.NEGATIVE){
      yaw += increaseAngules;
    } else {
      yaw -= increaseAngules;
    }
    if(abs(yaw) >= 360) yaw = 0;
    updateDirectorVector();
  }
  
  public void moveCenterY(Direction direction){
    if(direction == Direction.NEGATIVE){
      pitch += increaseAngules;
    } else {
      pitch -= increaseAngules;
    }
    if (abs(pitch) >= 360) pitch = 0;
    updateDirectorVector();
  }
  
  public void moveAngule(Direction direction){
    if(direction == Direction.NEGATIVE) {
      roll -= increaseAngules;
    } else {
      roll += increaseAngules;
    }
    if(abs(roll) >= 360) roll = 0;
    cameraUp.x = sin(radians(roll));
    cameraUp.y = cos(radians(roll));
  }
```

## Ocultación
Para poder representar el panel de la nave y el menú de los controles, se ha jugado con el algoritmo de ocultación que nos oferce *processing*, de hecho el panel tan solo es un rectangulo con una textura pegada pero a la hora representarlo se ha desactivado el algoritmo y guardado las coordenadas del sistema planetario, este procedimento es igual para las letras:

```java
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
```

## Eventos y Controles

<table style="width:100%">
  <tr>
    <th>Tecla</th>
    <th>Uso</th>
  </tr>
  <tr>
    <td>w</td>
    <td>Mueve la nave hacia delante</td>
  </tr>
  <tr>
    <td>s</td>
    <td>Mueve la nave hacia atrás</td>
  </tr>
  <tr>
    <td>a</td>
    <td>Mueve la nave hacia izquierda</td>
  </tr>
  <tr>
    <td>d</td>
    <td>Mueve la nave hacia derecha</td>
  </tr>
  <tr>
    <td>Flechas del teclado</td>
    <td>Mover el ángulo de visión de la camara</td>
  </tr>
  <tr>
    <td>f</td>
    <td>Resetea la posición de la nave</td>
  </tr>
  <tr>
    <td>o</td>
    <td>Inclina la nave hacia la derecha, se puede dar una vuelta completa</td>
  </tr>
  <tr>
    <td>p</td>
    <td>Inclina la nave hacia la izquierda, se puede dar una vuelta completa</td>
  </tr>
</table>

## Bibliografía

* [Guion de prácticas](https://cv-aep.ulpgc.es/cv/ulpgctp20/pluginfile.php/126724/mod_resource/content/22/CIU_Pr_cticas.pdf)
* [processing.org](https://processing.org/)
* [Camara OpenGL](https://learnopengl.com/Getting-started/Camera)
