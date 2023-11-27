class Track {
  // fields
  float xPos1, yPos1, xPos2, yPos2;  
  ArrayList<Nodes> nodes;
  
  
  // constructor
  Track(float x1, float y1, float x2, float y2) {
    this.xPos1 = x1;
    this.yPos1 = y1;
    this.xPos2 = x2;
    this.yPos2 = y2;
  }
  
  
  // methods
  void createNodes(float x1, float y1, float x2, float y2) {  // beginning & ending points
    nodes.add(Node node1);
    createNode(x1, y1, x2, y2);
  }

  void drawLine() {
    
  }
  
  void changeColor() {
    
  }
  
  void deleteTrack() {
    deleteNode();
  }
}
