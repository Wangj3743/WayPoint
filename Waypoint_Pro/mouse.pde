
void mousePressed() {
  scale(zoom);


  if (createTrack == false && createComponent == false && selectObject == false) {
    dragScreen = true;
    iniDragX = mouseX;
    iniDragY = mouseY;
  }

  if (createTrack == true) { // user selects to createTrack
    temp_x1 = mouseX/zoom;
    temp_y1 = mouseY/zoom;
  }

  if (createComponent == true) {



    float temp_compx = float(mouseX)/zoom;
    float temp_compy= float(mouseY)/zoom;
    Component component_chosen_drawn = new Component(component_chosenText, component_chosen.val, temp_compx, temp_compy, component_chosen.rotation, false);
    compsList.add(component_chosen_drawn);

    println("why", component_chosen.pos);
  }
  if (selectObject == true) {

    for ( Component C : compsList) {

      if (dist(mouseX/zoom, mouseY/zoom, C.pos.x, C.pos.y) < 50) {
        println(C, "is been selected");
        C.select = true;
        componentSelected = C;
      }
    }
    for (Track T : tracksList) {



      float m = round((T.y2-T.y1)/(T.x2-T.x1));
      print(T.x1, T.y1, T.x2, T.y2, m);
      float b =-( m * T.x2 - T.y2);

      float d = abs(mouseX*m/zoom-mouseY/zoom+b)/(sqrt(m*m+1));


      line(T.x1, m*T.x1+b, T.x2, m*T.x2+b);
      float distX = abs(T.x1-T.x2);
      float distY = abs(T.y1-T.y2);
      if (abs(d)<40  && mouseX/zoom <=(T.x1+T.x2)/2.0 + distX+20 && mouseX/zoom>=(T.x1+T.x2)/2.0 - distX-20 && mouseY/zoom <=(T.y1+T.y2)/2.0+distY+20 && mouseY/zoom >=(T.y1+T.y2)/2.0-distY-20) { //and its in the box
        println(T, "is been selected");
        T.select = true;
        trackSelected = T;
        T.col = color(255, 255, 255);
      }
    }
  }
}



void mouseReleased() {
  scale(zoom);
  dragScreen = false;
  if (createTrack == true) { // user selects to createTrack
    if (temp_x2 != 0 && temp_y2 != 0) {
      tracksList.add(new Track(temp_x1, temp_y1, temp_x2, temp_y2, selectTrack, trackColor));
    }
  }
  temp_x1 = 0;
  temp_y1 = 0;
  temp_x2 = 0;
  temp_y2 = 0;
}


void mouseDragged() {

  scale(zoom);

  if (createTrack == false && createComponent == false && selectObject == false) {
    dragScreen = true;
    dragX = mouseX- iniDragX;
    dragY = mouseY- iniDragY;
  }
  if (selectObject == true) {

    if (componentSelected != null) {


      if (componentSelected.select == true) {
        componentSelected.pos.x = mouseX/zoom;
        componentSelected.pos.y = mouseY/zoom;
      }
    }
  }
}


void mouseWheel(MouseEvent event) {
  wheelX = mouseX;
  wheelY = mouseY;
  zoom = (zoom - event.getCount()*zoom_sensitivity);
}
