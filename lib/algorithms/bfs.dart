import 'package:ai_project/models/node_mpdel.dart';

String bfsWithGoal(Node root, String goal) {
  List<String> result = [];
  Set<String> visited = {};
  List<Node> queue = [root];

  bool foundGoal = false;

  while (queue.isNotEmpty && !foundGoal) {
    Node node = queue.removeAt(0);
    if (!visited.contains(node.name)) {
      visited.add(node.name);
      result.add(node.name);

      if (node.name == goal) {
        foundGoal = true;
      } else {
        if (node.left != null) queue.add(node.left!);
        if (node.right != null) queue.add(node.right!);
      }
    }
  }

  return "Path: ${result.join(' → ')}";
}

Node buildTree() {
  return Node(
    name: 'A',
    left: Node(name: 'B', left: Node(name: 'D'), right: Node(name: 'E')),
    right: Node(name: 'C', left: Node(name: 'F'), right: Node(name: 'G')),
  );
}
