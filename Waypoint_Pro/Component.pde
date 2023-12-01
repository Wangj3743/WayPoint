class Component {
  //field
  PVector pos = new PVector ();
  PVector pad = new PVector ();
  float val;
  String type;
  PImage img;
  Boolean visible;


  //component
  Component(String t, float v, float z, float r) {
    this.type = t;
    this.pos.x = z;
    this.pos.y = r;
    this.val = v;

    visible = true;

    if (type == "Battery") {
      this.img = Battery;
    }
    if (type == "Resistor")
      this.img = Resistor;
    if (type == "Capacitor") {
      this.img = Capacitor;
      println("aaaaaaaaaaaa");
      println("cap:", Capacitor);
      println("img:", this.img);
    }
    if (type == "LED_Light")
      this.img = LED_Light;
    if (type == "Voltage_Regulator")
      this.img = Voltage_Regulator;
  }


  //constrcutor


  //methods
  void previewComponent() {
    image(this.img, mouseX, mouseY);
  }
  void drawComponent() {
    println(this.pos);
    if (visible = true) {
      image(this.img, this.pos.x, this.pos.y);
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
    rotate(PI/2.0);
    this.drawComponent();
  }

  void select() {
    this.pos.x = mouseX;
    this.pos.y = mouseY;
    this.deleteComponent();
    tint(255, 126);
    visible = true;
    this.drawComponent();
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
