// packages, libraries
import g4p_controls.*;


// editable variables
float gridDotSpacing = 50;
float gridDotSize = 2;

color trackColor = color(255, 0, 0);
float trackWeight = 5;


// global variables
// tracks and component lists
ArrayList<Track> tracksList = new ArrayList<Track> ();
ArrayList<Component> compsList = new ArrayList<Component> ();

// if user chooses to...
boolean createTrack = false;

// temporary values 
float temp_x1, temp_y1, temp_x2, temp_y2;

// component images 
PImage Battery;
PImage LED_Light;
PImage Capacitor;
PImage Voltage_Regulator;
PImage Transistor;
PImage Resistor;


void setup() {
  size(900, 900);
  shapeMode(CENTER);
  
  // path of component images
  Battery = loadImage("images/Battery.png");
  LED_Light = loadImage("images/LED.png");
  Capacitor = loadImage("images/Capacitor.png");
  Transistor = loadImage("images/Transistor.png");
  Resistor = loadImage("images/Resistor.png");
  Voltage_Regulator = loadImage("images/Voltage_Regulator.png");

  // size of component images
  Battery.resize(30,26);
  LED_Light.resize(10,23);
  Capacitor.resize(25,25);
  Transistor.resize(34,12);
  Resistor.resize(25,25);
  Voltage_Regulator.resize(19,23);
  
  createTrack = true; // remove in final
}


void draw() {
  background(204);
  
  // draw guide dots
  strokeWeight(1);
  stroke(0);
  for (int i=0; i<width; i+=gridDotSpacing) {
    for (int j=0; j<height; j+=gridDotSpacing) {
      circle(i, j, gridDotSize);
    } 
  }
  
  // draw tracks
  for (Track T: tracksList) {
    T.drawTrack();
  }
  
  if (mousePressed == true && createTrack == true) { // user selects to createTrack
    temp_x2 = mouseX;
    temp_y2 = mouseY;
    //float h = dist(temp_x1, temp_y1, temp_x2, temp_y2);
    //float RAA = atan2(abs(temp_y2-temp_y1), abs(temp_x2-temp_x1));
    //// find theta
    //float theta = RAA;
    //if (temp_x2 < temp_x1 && -temp_y2 > -temp_y1) {  // Q2
    //  theta = PI - RAA;
    //} else if (temp_x2 < temp_x1 && -temp_y2 < -temp_y1) {  // Q3
    //  theta = PI + RAA;
    //} else if (temp_x2 > temp_x1 && -temp_y2 < -temp_y1) {  // Q4
    //  theta = TWO_PI - RAA;
    //}
    ////println("theta 1:", theta);
    
    //float modRot = theta % (PI/4);
    //if (modRot < PI/8)
    //  theta = theta - modRot;
    //else
    //  theta = theta + PI/4 - modRot;
      
    ////println("theta 2:", theta);
    //float opp = h*asin(theta);
    //float adj = h*acos(theta);
    
    //if (Float.isNaN(opp)) {
    //  //opp = ;
    //}
    //if (Float.isNaN(adj)) {
    //  //adj = ;
    //}
    
    //temp_x2 = opp;
    //temp_y2 = adj;
    
    stroke(trackColor+255);
    strokeWeight(trackWeight);
    line(temp_x1, temp_y1, temp_x2, temp_y2); // preview line
  }
}


void mousePressed() {
  if (createTrack == true) { // user selects to createTrack
    temp_x1 = mouseX;
    temp_y1 = mouseY;
  }
}


void mouseReleased() {
   if (createTrack == true) { // user selects to createTrack
     //createTrack = false; // uncomment in final
     tracksList.add(new Track(temp_x1, temp_y1, temp_x2, temp_y2));
   }
   temp_x1 = 0;
   temp_y1 = 0;
   temp_x2 = 0;
   temp_y2 = 0;
}
