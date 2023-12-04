void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      temp_int = temp_int+1;
    } else if (keyCode == DOWN) {
      temp_int = temp_int-1;
    } 
  }   
  
  //if (key == "r") {
  
  //}
  
  component_chosenText = avaCompList[abs(temp_int)%5];
  println(component_chosenText);
}
