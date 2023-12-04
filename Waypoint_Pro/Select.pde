void select() {
  boolean selected = false;

  // Check if the mouse is overlapping with a component
  for (Component comp : compsList) {
    if (isMouseOverlappingComponent(comp)) {
      comp.select();
      selected = true;
      break;
    }
  }

  // If not selected, check pads, nodes, or tracks
  if (!selected) {
    for (Pad pad : padsList) {
      if (isMouseOverlappingPad(pad)) {
        // Handle pad selection or actions related to pads here
        selected = true;
        break;
      }
    }
    if (!selected) {
      for (Node node : nodesList) {
        if (isMouseOverlappingNode(node)) {
          node.nodeSelected = true;
          selected = true;
          break;
        }
      }
      if (!selected) {
        for (Track track : tracksList) {
          if (isMouseOverlappingTrack(track)) {
            track.trackSelected = true;
            selected = true;
            break;
          }
        }
      }
    }
  }
}

boolean isMouseOverlappingComponent(Component comp) {
  // Check if the mouse is overlapping with the component boundaries
  return mouseX > comp.pos.x && mouseX < (comp.pos.x + comp.img.width) &&
         mouseY > comp.pos.y && mouseY < (comp.pos.y + comp.img.height);
}

boolean isMouseOverlappingPad(Pad pad) {
  // Check if the mouse is overlapping with the pad boundaries
}

boolean isMouseOverlappingNode(Node node) {
  // Check if the mouse is overlapping with the node boundaries
  
}

boolean isMouseOverlappingTrack(Track track) {
  // Check if the mouse is overlapping with the track boundaries
}
