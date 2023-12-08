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
    if (this.type.equals("Battery"))
      this.img = Battery;
    if (this.type.equals("Resistor"))
      this.img = Resistor;
    if (this.type.equals("Capacitor"))
      this.img = Capacitor;
    if (this.type.equals("LED_Light"))
      this.img = LED_Light;
    if (this.type.equals("Voltage_Regulator"))
      this.img = Voltage_Regulator;
    if (this.type.equals("Transistor"))
      this.img = Transistor;

  }


  //constrcutor


  //methods
  void previewComponent() {

     imageMode(CENTER);
     
  
    image(this.img, this.pos.x,this.pos.y);
     
    
  }
  void drawComponent() {



    if (visible = true) {
      imageMode(CENTER);

     
      image(this.img, this.pos.x, this.pos.y);
      textSize(20);
      text(this.val, this.pos.x, this.pos.y);
     
    
    
    
    if (this.select == true){
      circle(this.pos.x,this.pos.y,20);
    }
    }

  }

  void deleteComponent() {
    visible = false;
  }

  void createPadding() {
  }
  void moveComponent() {
  }



  void select() {
    this.pos.x = mouseX/zoom;
    this.pos.y = mouseY/zoom;
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
