void exportProject() {
  
  fileExport.close();
}


void importProject(String[] fileImport) {
  int indexComp, indexTrack;
  
  for (int i; i<fileImport.length; ++i) {
    if (fileImport[i] == "# COMPONENTS")
      indexComp = i;
    else if (fileImport[i] == "# TRACKS")
      indexTrack = i;
  }
  
  for (int i=indexComp; i<indexTrack; ++i) { //
    String curr = fileImport[i];
    int[] commas = new int[5];
    
    for (int i; i<curr.length(); ++i) {
      if (commas.length() != 0)
        curr.indexOf(",", commas[i-1]);
    }
    
    String t = curr[0 : commas[0]]; // type
    float v = curr[ ];  // value
    float z = curr[ ];  // x value
    float r = curr[ ];  // y value
    float rota = curr[ ];  // rotate
    boolean sel = curr[ ];  // select
    
    compsList.add(new Component(t, v, z, r, rota, sel));
  }
  
  for (int i=indexTrack; 0<fileImport.length; ++i) {
    tracksList.add();
  }
  
  compsList;
}


void screenshot(String format) { // exports what the user sees as an image
  String fileName = "output.";
  fileName += format;
  save(fileName);
}


void exportImage(String format) { // exports the user's entire workspace as an image
  zoom = 1;
  screenshot(format);
}
