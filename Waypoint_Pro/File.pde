void schematicSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    schematic = loadImage(selection.getAbsolutePath());
    println("User selected " + selection.getAbsolutePath());
  }
}

void fileSelected(File fileselection) {
  if (fileselection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    fileImp = loadStrings(fileselection.getAbsolutePath());
    println("User selected " + fileselection.getAbsolutePath());
  }
}


void exportProject(PrintWriter fileExport) {
  // export components
  fileExport.println("# COMPONENTS");
  for (int i=0; i<compsList.size(); ++i) {
    Component curr = compsList.get(i);
    
    String t = curr.type; // type
    float v = curr.val;  // comp value
    float z = curr.pos.x;  // x value
    float r = curr.pos.y;  // y value
    float rota = curr.rotation;  // rotate
    boolean sel = curr.select;  // select
    fileExport.println(t+", "+v+", "+z+", "+r+", "+rota+", "+sel);
  }
  
  // export tracks
  fileExport.println("# TRACKS");
  for (int i=0; i<tracksList.size(); ++i) {
    Track curr = tracksList.get(i);
    
    float xPos1 = curr.x1;
    float yPos1 = curr.y1;
    float xPos2 = curr.x2;
    float yPos2 = curr.y2;
    boolean sel = curr.select; // select
    fileExport.println(xPos1+", "+yPos1+", "+xPos2+", "+yPos2+", "+sel);
  }
}


void importProject(String[] fileImport) {
  int indexComp = 0;
  int indexTrack = 0;
  
  // find the sections in input.txt that denotes components and tracks
  for (int i=0; i<fileImport.length; ++i) {
    if (fileImport[i].equals("# COMPONENTS")) 
      indexComp = i;
    else if (fileImport[i].equals("# TRACKS"))
      indexTrack = i;
  }
  
  // import components
  for (int i=indexComp+1; i<indexTrack; ++i) {
    String curr = fileImport[i];
    int[] commas = findCommas(curr, 5);

    String t = curr.substring(0, commas[0]); // type
    float v = float(curr.substring(commas[0]+2, commas[1]));  // comp value
    float z = float(curr.substring(commas[1]+2, commas[2]));  // x value
    float r = float(curr.substring(commas[2]+2, commas[3]));  // y value
    float rota = float(curr.substring(commas[3]+2, commas[4]));  // rotate
    boolean sel = boolean(curr.substring(commas[4]+2, curr.length()));  // select
    compsList.add(new Component(t, v, z, r, rota, sel));
  }
  
  // import tracks
  for (int i=indexTrack+1; i<fileImport.length; ++i) {
    String curr = fileImport[i];
    int[] commas = findCommas(curr, 4);
    
    float xPos1 = float(curr.substring(0, commas[0]));
    float yPos1 = float(curr.substring(commas[0]+2, commas[1]));
    float xPos2 = float(curr.substring(commas[1]+2, commas[2]));
    float yPos2 = float(curr.substring(commas[2]+2, commas[3]));
    boolean sel = boolean(curr.substring(commas[3]+2, curr.length())); // select
    tracksList.add(new Track(xPos1, yPos1, xPos2, yPos2, sel, trackColor));
  }
}



void screenshot(String format) { // exports what the user sees as an image
  String fileName = "output.";
  fileName += format;
  save(fileName);
}




int[] findCommas(String curr, int numPara) {
  int[] commas = new int[numPara];
  
  for (int j=0; j<numPara; ++j) {
    if (j == 0) {
      commas[j] = curr.indexOf(",");
    }
    else {
      commas[j] = curr.indexOf(", ", commas[j-1]+1);
    }
  }
  return commas;
}
