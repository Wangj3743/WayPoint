// packages, libraries
import g4p_controls.*;

// editable variables
float gridDotSpacing = 50;  
float gridDotSize = 2;

color trackColor = color(255, 0, 0);
float trackWeight = 5;

float temp_rot = 4.0; //rotation of the image
String component_chosenText = "battery";//default component

// tracks and component lists
ArrayList<Track> tracksList = new ArrayList<Track> ();
ArrayList<Component> compsList = new ArrayList<Component> ();
String[] avaCompList = {"battery", "ledLight", "capacitor", "transistor", "resistor", "voltageRegulator"};

// if user chooses to...
boolean createTrack;
boolean createComponent;
boolean selectObject;
boolean selectComponent = false;
boolean selectTrack = false;
boolean showSchematic = false;
boolean dragScreen = false;


// temporary values
float temp_x1, temp_y1, temp_x2, temp_y2;
int temp_int = 0;
float tempVal = 0.0;
float zoom_sensitivity = 0.04;
float zoom = 1;
float wheelX;
float wheelY;
float dragX;
float dragY;
float iniDragX;
float iniDragY;



// component images
int magn = 3; //the magnifying factor used to resize images
PImage battery;
PImage ledLight;
PImage capacitor;
PImage voltageRegulator;
PImage transistor;
PImage resistor;
PImage schematic;

//Track Class
Track trackSelected;

//Component Class
Component componentSelected;
Component component_chosen;




void setup() {
  size(900, 900);
  imageMode(CENTER);
  shapeMode(CENTER);
  createGUI();


  // path of component images
  battery = loadImage("images/battery.png");
  ledLight = loadImage("images/LED.png");
  capacitor = loadImage("images/capacitor.png");
  transistor = loadImage("images/transistor.png");
  resistor = loadImage("images/resistor.png");
  voltageRegulator = loadImage("images/voltageRegulator.png");
  schematic = loadImage("Imported_schematic/schematic1.png");

  // resize of component images
  battery.resize(magn*30, magn*26);
  ledLight.resize(magn*10, magn*23);
  capacitor.resize(magn*25, magn*25);
  transistor.resize(magn*34, magn*12);
  resistor.resize(magn*25, magn*25);
  voltageRegulator.resize(magn*19, magn*23);
  print(resistor);
  
  
    String[] fileImport = loadStrings("input.txt"); 
  importProject(fileImport);  // imports a file called 'input.txt'

}


void draw() {
  background(204);
  scale(zoom);

  // draw guide dots
  strokeWeight(1);
  stroke(0);
  for (int i=0; i<5000; i+=gridDotSpacing) {
    for (int j=0; j<5000; j+=gridDotSpacing) {
      circle(i, j, gridDotSize);
    }
  }

  //draw components
  for (Component C : compsList) {
    
    print(resistor);
    C.drawComponent();
  }
  
  //draw tracks
  for (Track T : tracksList) {
    T.drawTrack();
  }
  
  //create new component that is to be drawn on the canvas
  component_chosen = new Component(component_chosenText, tempVal, float(mouseX)/zoom, float(mouseY)/zoom, temp_rot, selectComponent);

  // user selects to createTrack
  if (mousePressed == true && createTrack == true) {
    temp_x2 = mouseX/zoom;
    temp_y2 = mouseY/zoom;

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

  //preview component
  if  (mousePressed == false && createComponent == true) {
    component_chosen.previewComponent();
  }
  
  //show image of schematic
  if (showSchematic == true) {
    image(schematic, width/2.0, height/2.0);} 
}
