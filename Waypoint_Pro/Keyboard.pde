void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      i = i+1;
    } else if (keyCode == DOWN) {
      i = i-1;
    } 
  } 
  
  component_chosenText = avaCompList[abs(i)%5];
  println(component_chosenText);
}
