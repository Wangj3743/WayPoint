int components = 1;
int padding = 2;
int nodes = 3;
int tracks = 4;

void select(int priority) {
  switch (priority) {
    case 1:
      Component myComponent = new Component();
      myComponent.drawComponent();
      break;

    case 2:
      Padding myPadding = new Padding();
      myPadding.drawPadding();
      break;

    case 3:
      // Perform actions related to nodes
      Node myNode = new Node();
      myNode.createNode();
      break;

    case 4:
      Track myTrack = new Track();
      myTrack.createTrack();
      break;

    default:

      break;
  }
}
