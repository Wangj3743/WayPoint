class Component{

//field
PVector<float> pos,pad;
float val;
String type;
PImage img;
Boolean visible;



//component
Component(String t,float v,float x,float y,)
this.type = t;
ths.pos.x = x;
this.pos.y = y;
this.val = v;
visible = true;

if (type = Battery)
img = Battery
if (type = Resistor)
img = Resistor
if (type = Capacitor)
img = Capacitor
if (type = LED_Light)
img = LED_Light
if (type = Voltage_Regulator)
img = Voltage_Regulator


//constrcutor


//methods

  void drawComponent(){
  if (visible = true){
  image(this.img, this.pos.x, this.pos.y);
  }
  void deleteComponent(){
  visible = false;
  }

  void createPadding()               
  void moveComponent()

  void rotateComponent(float radian){
    this.deleteComponent();
    rotate(PI/2.0);  
    this.drawComponent();
  }

void select(){
this.x = mouseX;
this.y - mouseY;
this.deleteComponent;
tint(255, 126);
visible = true;
this.drawComponent();

}

void deselect(){
this.x = this.x;
this.y = this.y;
this.deleteComponent;
tint(255,255);
visible = true;
this.drawComponent();

}

 
  
  
  
}
