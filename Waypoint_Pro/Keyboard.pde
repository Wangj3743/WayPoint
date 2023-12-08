void keyPressed() {
  if (key == CODED) {
    
    if (keyCode == UP) {
      temp_int = temp_int+1;
      
    } else if (keyCode == DOWN) {
      temp_int = temp_int-1;
    }
    
  } else if (keyCode == ENTER) {
    if (componentSelected.select == true);
    componentSelected.rotation += PI/2;
    
  } else if (keyCode == BACKSPACE) {
    if (componentSelected != null) {
      if (componentSelected.select == true);
      compsList.remove(componentSelected);
    }


    if (trackSelected != null) {
      if (trackSelected.select == true);
      tracksList.remove(trackSelected);
    }
  }
  component_chosenText = avaCompList[abs(temp_int)%5];
}
