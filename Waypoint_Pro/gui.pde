/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:369783:

} //_CODE_:window1:369783:

public void component_click(GButton source, GEvent event) { //_CODE_:component:692527:
 println("component - GButton >> GEvent." + event + " @ " + millis());
  //turn on createComponent
  createTrack = false;
  createComponent = !createComponent;
  selectObject = false;
} //_CODE_:component:692527:

public void track_click(GButton source, GEvent event) { //_CODE_:track:436593:
 println("track - GButton >> GEvent." + event + " @ " + millis());
 //turn on create Track
  createTrack = !createTrack;
  createComponent = false;
  selectObject = false;
} //_CODE_:track:436593:

public void button3_click1(GButton source, GEvent event) { //_CODE_:select:249474:
 println("button3 - GButton >> GEvent." + event + " @ " + millis());
  //turn on select
  createTrack = false;
  createComponent = false;
  selectObject = !selectObject;
} //_CODE_:select:249474:

public void button1_click1(GButton source, GEvent event) { //_CODE_:savebutton:300975:
 println("savebutton - GButton >> GEvent." + event + " @ " + millis());
 //allow user to save their work
   PrintWriter fileExport = createWriter("output.txt");
  exportProject(fileExport);
  fileExport.close();
  
  
  
  
} //_CODE_:savebutton:300975:

public void slider_change(GSlider source, GEvent event) { //_CODE_:slider:777945:
 println("slider - GSlider >> GEvent." + event + " @ " + millis());
 //zomming in and out
  zoom = slider.getValueF();
  
  
} //_CODE_:slider:777945:

public void textfield1_change1(GTextField source, GEvent event) { //_CODE_:textfield1:562215:
 println("textfield1 - GTextField >> GEvent." + event + " @ " + millis());
 //value input for the components
  tempVal = float(textfield1.getText());
} //_CODE_:textfield1:562215:

public void button1_click2(GButton source, GEvent event) { //_CODE_:showScreen:868154:
 println("showScreen - GButton >> GEvent." + event + " @ " + millis());
  showSchematic = !showSchematic;
  print(showSchematic);
  
} //_CODE_:showScreen:868154:

public void button1_click3(GButton source, GEvent event) { //_CODE_:openSchematic:582783:
 println("openSchematic - GButton >> GEvent." + event + " @ " + millis());
    selectInput("Select a file to process:", "schematicSelected");

} //_CODE_:openSchematic:582783:

public void button1_click4(GButton source, GEvent event) { //_CODE_:screenshot:938354:
 println("screenshot - GButton >> GEvent." + event + " @ " + millis());
  screenshot("png");
} //_CODE_:screenshot:938354:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  window1 = GWindow.getWindow(this, "WayPoint Pro Control ", 0, 0, 600, 300, JAVA2D);
  window1.noLoop();
  window1.setActionOnClose(G4P.KEEP_OPEN);
  window1.addDrawHandler(this, "win_draw1");
  component = new GButton(window1, 39, 36, 80, 30);
  component.setText("component");
  component.addEventHandler(this, "component_click");
  track = new GButton(window1, 40, 107, 80, 30);
  track.setText("Track");
  track.addEventHandler(this, "track_click");
  select = new GButton(window1, 38, 181, 80, 30);
  select.setText("select");
  select.addEventHandler(this, "button3_click1");
  savebutton = new GButton(window1, 323, 192, 80, 30);
  savebutton.setText("save");
  savebutton.addEventHandler(this, "button1_click1");
  slider = new GSlider(window1, 162, 94, 100, 40, 10.0);
  slider.setLimits(2.0, 0.5, 2.0);
  slider.setNumberFormat(G4P.DECIMAL, 2);
  slider.setOpaque(false);
  slider.addEventHandler(this, "slider_change");
  textfield1 = new GTextField(window1, 155, 38, 120, 30, G4P.SCROLLBARS_NONE);
  textfield1.setOpaque(true);
  textfield1.addEventHandler(this, "textfield1_change1");
  showScreen = new GButton(window1, 37, 246, 80, 30);
  showScreen.setText("Schematic");
  showScreen.addEventHandler(this, "button1_click2");
  openSchematic = new GButton(window1, 325, 107, 80, 30);
  openSchematic.setText("Open Schematic");
  openSchematic.addEventHandler(this, "button1_click3");
  screenshot = new GButton(window1, 321, 46, 80, 30);
  screenshot.setText("screenshot");
  screenshot.addEventHandler(this, "button1_click4");
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GButton component; 
GButton track; 
GButton select; 
GButton savebutton; 
GSlider slider; 
GTextField textfield1; 
GButton showScreen; 
GButton openSchematic; 
GButton screenshot; 
