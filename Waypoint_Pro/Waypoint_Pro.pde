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
boolean createTrack;
boolean createComponent;
boolean selectObject;


// temporary values
float temp_x1, temp_y1, temp_x2, temp_y2;

// component images
PImage Battery;
PImage LED_Light;
PImage Capacitor;
PImage Voltage_Regulator;
PImage Transistor;
PImage Resistor;
int magn;

Component Resistor1;

void setup() {
  size(900, 900);
  shapeMode(CENTER);


  createGUI();
  // path of component images
  Battery = loadImage("images/Battery.png");
  LED_Light = loadImage("images/LED.png");
  Capacitor = loadImage("images/Capacitor.png");
  Transistor = loadImage("images/Transistor.png");
  Resistor = loadImage("images/Resistor.png");
  Voltage_Regulator = loadImage("images/Voltage_Regulator.png");

  // size of component images
  magn = 3;
  Battery.resize(magn*30, magn*26);
  LED_Light.resize(magn*10, magn*23);
  Capacitor.resize(magn*25, magn*25);
  Transistor.resize(magn*34, magn*12);
  Resistor.resize(magn*25, magn*25);
  Voltage_Regulator.resize(magn*19, magn*23);

   // remove for testing in the final version
  Resistor1 = new Component("Resistor", 9.0, float(mouseX),float(mouseY));
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


  //draw tracks
  for (Track T : tracksList) {
    T.drawTrack();
  }

   //draw components
  for (Component C: compsList) {
    C.drawComponent();
  }


  // user selects to createTrack
  if (mousePressed == true && createTrack == true) {
    temp_x2 = mouseX;
    temp_y2 = mouseY;

    float h = dist(temp_x1, temp_y1, temp_x2, temp_y2);
    float RAA = atan2(abs(temp_y2-temp_y1), abs(temp_x2-temp_x1));

    // find theta
    float theta = RAA;
    if (temp_x2 < temp_x1 && -temp_y2 > -temp_y1) {  // Q2
      theta = PI - RAA;
    } else if (temp_x2 < temp_x1 && -temp_y2 < -temp_y1) {  // Q3
      theta = PI + RAA;
    } else if (temp_x2 > temp_x1 && -temp_y2 < -temp_y1) {  // Q4
      theta = TWO_PI - RAA;
    }

    int n = int(theta/(PI/8)); // number of 22.5 deg (PI/8 rad) segments the angle has passed
    float drawnAngle;
    drawnAngle = (n + n % 2) * (PI/8); // the number of 22.5 deg (PI/8 rad) segments that n is closest to, times PI/8 rad

    float opp = h*sin(drawnAngle);
    float adj = h*cos(drawnAngle);

    temp_x2 = adj+(temp_x1);      // new x value of point 2
    temp_y2 = -opp+(temp_y1);    // new x value of point 2

    stroke(trackColor+255);
    strokeWeight(trackWeight);
    line(temp_x1, temp_y1, temp_x2, temp_y2); // preview line
  }


  if  (mousePressed == false && createComponent == true) {
    Resistor1.previewComponent();
  }
}


void mousePressed() {
  if (createTrack == true) { // user selects to createTrack
    temp_x1 = mouseX;
    temp_y1 = mouseY;
  }

  if (createComponent == true) {

    println(Resistor1.pos);

    println(mouseX, mouseY);

    createComponent = false;
    float temp_compx = float(mouseX);
    float temp_compy= float(mouseY);
    Component Resistor1_drawn = new Component("Resistor", 9.0, temp_compx,temp_compy);
    compsList.add(Resistor1_drawn);
    
    println("why",Resistor1.pos);
  }
}


void mouseReleased() {
  if (createTrack == true) { // user selects to createTrack
    createTrack = false;
    tracksList.add(new Track(temp_x1, temp_y1, temp_x2, temp_y2));
  }
  temp_x1 = 0;
  temp_y1 = 0;
  temp_x2 = 0;
  temp_y2 = 0;
}
