//void select() {
//    if (mousePressed && (mouseButton == LEFT)) {
//        boolean selected = false;

//        // Check if the mouse is overlapping with a component
//        for (Component comp : components) {
//            if (isMouseOverlappingComponent(comp)) {
//                comp.select();
//                selected = true;
//                // If a component is selected, break the loop
//                break;
//            }
//        }

//        // If not selected, check pads, nodes, or tracks
//        if (!selected) {
//            for (Pad pad : pads) {
//                if (isMouseOverlappingPad(pad)) {
//                    pad.select();
//                    selected = true;
//                    break;
//                }
//            }
//            if (!selected) {
//                for (Node node : nodes) {
//                    if (isMouseOverlappingNode(node)) {
//                        node.select();
//                        selected = true;
//                        break;
//                    }
//                }
//                if (!selected) {
//                    for (Track track : tracks) {
//                        if (isMouseOverlappingTrack(track)) {
//                            track.select();
//                            selected = true;
//                            break;
//                        }
//                    }
//                }
//            }
//        }
//    }
//}

//boolean isMouseOverlappingComponent(Component comp) {
//    // Check if the mouse is overlapping with the component boundaries
//    return mouseX > comp.x && mouseX < (comp.x + comp.width) &&
//            mouseY > comp.y && mouseY < (comp.y + comp.height);
//}

//boolean isMouseOverlappingPad(Pad pad) {
//    // Check if the mouse is overlapping with the pad boundaries
//    return mouseX > pad.x && mouseX < (pad.x + pad.width) &&
//            mouseY > pad.y && mouseY < (pad.y + pad.height);
//}

//boolean isMouseOverlappingNode(Node node) {
//    // Check if the mouse is overlapping with the node boundaries
//    return mouseX > node.x && mouseX < (node.x + node.width) &&
//            mouseY > node.y && mouseY < (node.y + node.height);
//}

//boolean isMouseOverlappingTrack(Track track) {
//    // Check if the mouse is overlapping with the track boundaries
//    return mouseX > track.x1 && mouseX < track.x2 &&
//            mouseY > track.y1 && mouseY < track.y2;
//}
