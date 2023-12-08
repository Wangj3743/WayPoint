class Component {
  //field
  PVector pos = new PVector (); //position X
  PVector pad = new PVector (); //position y
  float val; //calue of the component
  String type;  //type of component
  PImage img;   //image
  float rotation; //the rotating angle
  boolean select; //indicate whether component is selected


  //Constructor
  Component(String t, float v, float z, float r, float rota, boolean sel) {
    this.type = t;
    this.pos.x = z;
    this.pos.y = r;
    this.val = v;
    this.rotation = rota;
    this.select = sel;

    //pair the image up with the compoenent
    if (this.type.equals("battery"))
      this.img = battery;
    if (this.type.equals("resistor"))
      this.img = resistor;

    if (this.type.equals("capacitor"))
      this.img = capacitor;
    if (this.type.equals("ledLight"))
      this.img = ledLight;
    if (this.type.equals("voltageRegulator"))
      this.img = voltageRegulator;
    if (this.type.equals("transistor")){
      this.img = transistor;}
     
  }


  //methods
  //preview the position and shape of component before permenetly drawing it on the canvs
  void previewComponent() {
    image(this.img, this.pos.x, this.pos.y);
  }
  
  //draw the components on the canvas
  void drawComponent() {   
    image(this.img, this.pos.x, this.pos.y);
    textSize(20);
    text(this.val, this.pos.x, this.pos.y);

    //if the component is selected, put a circle in the middle to indicate
    if (this.select == true) {
      circle(this.pos.x, this.pos.y, 20);
    }
  }

  //Allow the component to be dragged 
  void select() {
    this.pos.x = mouseX/zoom;
    this.pos.y = mouseY/zoom;
    circle(this.pos.x, this.pos.y, 20);
  }
}
