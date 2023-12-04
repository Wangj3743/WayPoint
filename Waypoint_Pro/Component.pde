class Component {
  //field
  PVector pos = new PVector ();
  PVector pad = new PVector ();
  float val;
  String type;
  PImage img;
  Boolean visible;
  float rotation;
  boolean select;

  //component
  Component(String t, float v, float z, float r,float rota, boolean sel) {
    this.type = t;
    this.pos.x = z;
    this.pos.y = r;
    this.val = v;
    this.rotation = rota;
    this.select = sel;

    visible = true;
//deselect after, rotate is always 0, 
    if (type == "Battery") {
      this.img = Battery;
    }
    if (type == "Resistor")
      this.img = Resistor;
    if (type == "Capacitor") {
      this.img = Capacitor;
    }
    if (type == "LED_Light")
      this.img = LED_Light;
    if (type == "Voltage_Regulator")
      this.img = Voltage_Regulator;
    if (type == "Transistor")
      this.img = Transistor;
  }


  //constrcutor


  //methods
  void previewComponent() {
    image(this.img, mouseX, mouseY);
  }
  void drawComponent() {

    if (visible = true) {
      image(this.img, this.pos.x, this.pos.y);
      textSize(20);
      text(this.val, this.pos.x, this.pos.y);
    }
  }

  void deleteComponent() {
    visible = false;
  }

  void createPadding() {
  }
  void moveComponent() {
  }

  void rotateComponent() {
    this.deleteComponent();
    //rotate always set to 0, set global varible fo select
    rotate(PI/2.0);
    this.drawComponent();
  }

  void select() {
    this.pos.x = mouseX;
    this.pos.y = mouseY;
    circle(this.pos.x, this.pos.y, 20);
    //this.deleteComponent();
    //tint(255, 126);
    //visible = true;
    //this.drawComponent();
  }

  void deselect() {
    this.pos.x = this.pos.x; // what does this achieve???
    this.pos.y = this.pos.y;
    this.deleteComponent();
    tint(255, 255);
    visible = true;
    this.drawComponent();
  }
}
