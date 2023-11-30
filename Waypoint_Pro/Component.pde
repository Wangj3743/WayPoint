class Component{
  //field
  PVector pos, pad;
  float val;
  String type;
  PImage img;
  Boolean visible;
  
  
  //component
  Component(String t,float v,float x,float y) {
    this.type = t;
    this.pos.x = x;
    this.pos.y = y;
    this.val = v;
    
    visible = true;
    
    if (type == "Battery")
      img = Battery;
    if (type == "Resistor")
      img = Resistor;
    if (type == "Capacitor")
      img = Capacitor;
    if (type == "LED_Light")
      img = LED_Light;
    if (type == "Voltage_Regulator")
      img = Voltage_Regulator;
  }
  
  
  //constrcutor
  
  
  //methods
    void drawComponent(){
      if (visible = true){
        image(this.img, this.pos.x, this.pos.y);
      }
    }
    
    void deleteComponent(){
      visible = false;
    }
  
    void createPadding(){}
    void moveComponent(){}
  
    void rotateComponent(float radian){
      this.deleteComponent();
      rotate(PI/2.0);  
      this.drawComponent();
    }
  
  void select(){
    this.pos.x = mouseX;
    this.pos.y = mouseY;
    this.deleteComponent();
    tint(255, 126);
    visible = true;
    this.drawComponent();
  }
  
  void deselect(){
    this.pos.x = this.pos.x; // what does this achieve???
    this.pos.y = this.pos.y;
    this.deleteComponent();
    tint(255,255);
    visible = true;
    this.drawComponent();
  }
}
