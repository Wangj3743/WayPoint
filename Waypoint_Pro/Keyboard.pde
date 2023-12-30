

void keyPressed() {
  if (key == CODED) {
    
    //switching between different component
    if (keyCode == UP) {
      temp_int = temp_int+1;
     
  
    
    } else if (keyCode == DOWN) {
      temp_int = temp_int-1;
  
    
    }
  }
  
 
 //Delete component 
  else if (keyCode == BACKSPACE) {
    if (componentSelected != null) {
      if (componentSelected.select == true);
      compsList.remove(componentSelected);
    }

    //delete only when there is at least one component selected to avoid error
    if (trackSelected != null) {
      if (trackSelected.select == true);
      tracksList.remove(trackSelected);
    }
  }
  
  //choose the component in the list of avalible component
  component_chosenText = avaCompList[abs(temp_int)%5];
}
