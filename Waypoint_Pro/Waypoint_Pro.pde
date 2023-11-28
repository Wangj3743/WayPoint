import g4p_controls.*;
PImage Battery;
PImage LED_Light;
PImage Capacitor;
PImage Voltage_Regulator;
PImage Transistor;
PImage Resistor;


void setup() {
  size(900, 900);
  Battery = loadImage("Battery.png");
  LED_Light = loadImage("LED.png");
  Capacitor = loadImage("Capacitor.png");
  Transistor = loadImage("Transistor.png");
  Resistor = loadImage("Resistor.png");
  Voltage_Regulator = loadImage("Voltage_Regulator.png");

  Battery.resize(30,26);
  LED_Light.resize(10,23);
  Capacitor.resize(25,25);
  Transistor.resize(34,12);
  Resistor.resize(25,25);
  Voltage_Regulator.resize(19,23);

  }


void draw() {
  
}
