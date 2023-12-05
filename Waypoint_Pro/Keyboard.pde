void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      println("up is pressed");
      temp_int = temp_int+1;
    } else if (keyCode == DOWN) {
      temp_int = temp_int-1;
    }
    
  }
    else if (keyCode == ENTER) {
      println("enter is pressed");
      if (componentSelected.select == true);
      componentSelected.rotation += PI/2;
    }
    
    
    
     else if (keyCode == BACKSPACE) {
      if (componentSelected.select == true);
      compsList.remove(componentSelected);
        println(component_chosenText,"should be delted");
    }
    
    
  



  component_chosenText = avaCompList[abs(temp_int)%5];

}
