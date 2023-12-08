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

    //deselect after, rotate is always 0,
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
    if (this.type.equals("transistor"))
      this.img = transistor;
  }


  //methods
  void previewComponent() {
    imageMode(CENTER);
    image(this.img, this.pos.x, this.pos.y);
  }
  
  void drawComponent() {
    imageMode(CENTER);
    image(this.img, this.pos.x, this.pos.y);
    textSize(20);
    text(this.val, this.pos.x, this.pos.y);

    if (this.select == true) {
      circle(this.pos.x, this.pos.y, 20);
    }
  }

  void select() {
    this.pos.x = mouseX/zoom;
    this.pos.y = mouseY/zoom;
    circle(this.pos.x, this.pos.y, 20);
  }
}
