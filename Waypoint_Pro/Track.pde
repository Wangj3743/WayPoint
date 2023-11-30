class Track {
  // fields
  float x1, y1, x2, y2;  
  boolean trackSelected = false;
  Node node1, node2;
  
  
  // constructor
  Track(float xPos1, float yPos1, float xPos2, float yPos2) {
    this.x1 = xPos1;
    this.y1 = yPos1;
    this.x2 = xPos2;
    this.y2 = yPos2;
    
    // create nodes
    node1 = new Node(this.x1, this.y1);
    node2 = new Node(this.x2, this.y2);
    
    drawTrack();
  }
  
  
  // methods
  void drawTrack() {
    // draw line
    stroke(trackColor);
    strokeWeight(trackWeight);
    line(this.x1, this.y1, this.x2, this.y2);
  }
  
  void changeColor() {
    
  }
  
  void deleteTrack() {
    node1.deleteNode();
    node2.deleteNode();
  }
}
