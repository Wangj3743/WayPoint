// packages, libraries
import g4p_controls.*;

// editable variables
float gridDotSpacing = 50;
float gridDotSize = 2;

color trackColor = color(255, 0, 0);
float trackWeight = 5;
float temp_rot = 4.0;


// global variables
// tracks and component lists
ArrayList<Track> tracksList = new ArrayList<Track> ();
ArrayList<Component> compsList = new ArrayList<Component> ();
String[] avaCompList = {"Battery", "LED_Light", "Capacitor", "Transistor", "Resistor", "Voltage_Regulator"};
float tempVal = 0.0;//a float steod temporaryly for tje text field
//ArrayList<String> avaCompList  = new ArrayList<String>("Battery","LED_Light","Capacitor","Transistor","Resistor","Voltage_Regulator");

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
float zoom_sensitivity = 0.04;
float zoom = 1;
float wheelX;
float wheelY;
float dragX;
float dragY;
float iniDragX;
float iniDragY;
void mouseWheel(MouseEvent event) {
  wheelX = mouseX;
  wheelY = mouseY;
  zoom = (zoom - event.getCount()*zoom_sensitivity);
}


// component images
PImage Battery;
PImage LED_Light;
PImage Capacitor;
PImage Voltage_Regulator;
PImage Transistor;
PImage Resistor;
int magn;
PImage Schematic;

Track trackSelected;
Component componentSelected;
Component component_chosen;
String component_chosenText = "Battery";//default ;
void setup() {
 


  imageMode(CENTER);
  size(900, 900);
  shapeMode(CENTER);

  
  
  createGUI();
  
  
  
  
  //open file
  
  
  // path of component images
  Battery = loadImage("images/Battery.png");
  LED_Light = loadImage("images/LED.png");
  Capacitor = loadImage("images/Capacitor.png");
  Transistor = loadImage("images/Transistor.png");
  Resistor = loadImage("images/Resistor.png");
  Voltage_Regulator = loadImage("images/Voltage_Regulator.png");
  Schematic = loadImage("Imported_Schematic/schematic1.png");

  // size of component images
  magn = 3;
  Battery.resize(magn*30, magn*26);
  LED_Light.resize(magn*10, magn*23);
  Capacitor.resize(magn*25, magn*25);
  Transistor.resize(magn*34, magn*12);
  Resistor.resize(magn*25, magn*25);
  Voltage_Regulator.resize(magn*19, magn*23);

  // remove for testing in the final version
  // component_chosen = new Component(component_chosenText, 0.0, float(mouseX),float(mouseY));
}


void draw() {
  background(204);
  
  if (showSchematic == true){
    print("it shoudl show");
  image(Schematic,width/2.0,height/2.0);
  }
  
   //translate(wheelX, wheelY);
  scale(zoom);
//translate(-wheelX, -wheelY);
//translate(dragX,dragY);

  component_chosen = new Component(component_chosenText, tempVal, float(mouseX)/zoom , float(mouseY)/zoom, temp_rot, selectComponent);
  
  
  

  
 

  // draw guide dots
  strokeWeight(1);
  stroke(0);
  for (int i=0; i<5000; i+=gridDotSpacing) {
    for (int j=0; j<5000; j+=gridDotSpacing) {
      circle(i, j, gridDotSize);
    }
  }


  //draw tracks
  for (Track T : tracksList) {
    T.drawTrack();
  }

  //draw components
  for (Component C : compsList) {

    C.drawComponent();
  }


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


  if  (mousePressed == false && createComponent == true) {
    component_chosen.previewComponent();
  }
}


void mousePressed() {
  scale(zoom);
  
  
   if (createTrack == false && createComponent == false && selectObject == false){
    dragScreen = true;
    iniDragX = mouseX;
    iniDragY = mouseY;
    
  }
  
  if (createTrack == true) { // user selects to createTrack
    temp_x1 = mouseX/zoom;
    temp_y1 = mouseY/zoom;
  }

  if (createComponent == true) {



    float temp_compx = float(mouseX)/zoom;
    float temp_compy= float(mouseY)/zoom;
    Component component_chosen_drawn = new Component(component_chosenText, component_chosen.val, temp_compx, temp_compy, component_chosen.rotation, false);
    compsList.add(component_chosen_drawn);

    println("why", component_chosen.pos);
  }
  if (selectObject == true) {

    for ( Component C : compsList) {

      if (dist(mouseX/zoom, mouseY/zoom, C.pos.x, C.pos.y) < 50) {
        println(C, "is been selected");
        C.select = true;
        componentSelected = C;
      }
    }
    for (Track T : tracksList) {



      float m = round((T.y2-T.y1)/(T.x2-T.x1));
      print(T.x1, T.y1, T.x2, T.y2, m);
      float b =-( m * T.x2 - T.y2);

      float d = abs(mouseX*m/zoom-mouseY/zoom+b)/(sqrt(m*m+1));


      line(T.x1,m*T.x1+b,T.x2,m*T.x2+b);
      float distX = abs(T.x1-T.x2);
      float distY = abs(T.y1-T.y2);
      if (abs(d)<40  && mouseX/zoom <=(T.x1+T.x2)/2.0 + distX+20 && mouseX/zoom>=(T.x1+T.x2)/2.0 - distX-20 && mouseY/zoom <=(T.y1+T.y2)/2.0+distY+20 && mouseY/zoom >=(T.y1+T.y2)/2.0-distY-20){ //and its in the box
        println(T, "is been selected");
        T.select = true;
        trackSelected = T;
        T.col = color(255, 255, 255);
      }
    }
  }
}





void mouseReleased() {
  scale(zoom);
dragScreen = false;
  if (createTrack == true) { // user selects to createTrack

    tracksList.add(new Track(temp_x1, temp_y1, temp_x2, temp_y2, selectTrack, trackColor));
  }
  temp_x1 = 0;
  temp_y1 = 0;
  temp_x2 = 0;
  temp_y2 = 0;
}


void mouseDragged() {
  
  scale(zoom);

  if (createTrack == false && createComponent == false && selectObject == false){
    dragScreen = true;
    dragX = mouseX- iniDragX;
    dragY = mouseY- iniDragY;
    
    
  }
  if (selectObject == true) {

    if (componentSelected != null) {


      if (componentSelected.select == true) {
        componentSelected.pos.x = mouseX/zoom;
        componentSelected.pos.y = mouseY/zoom;
      }
    }
  }
}



void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    Schematic = loadImage(selection.getAbsolutePath());
    println("User selected " + selection.getAbsolutePath());
  }
}
