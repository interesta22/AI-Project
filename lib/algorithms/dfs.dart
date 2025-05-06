import 'package:ai_project/models/node_mpdel.dart';

List<String> dfsWithGoal(Node root, String goal, {bool rightFirst = false}) {
  List<String> result = [];
  Set<String> visited = {};
  bool foundGoal = false;

  void dfs(Node? node) {
    if (node == null || visited.contains(node.name) || foundGoal) return;

    visited.add(node.name);
    result.add(node.name);

    if (node.name == goal) {
      foundGoal = true;
      return;
    }

    if (rightFirst) {
      dfs(node.right);
      dfs(node.left);
    } else {
      dfs(node.left);
      dfs(node.right);
    }
  }

  dfs(root);
  return ["Path: ${result.join(' → ')}"];
}

Node buildTreeOfDfs() {
  return Node(
    name: 'A',
    left: Node(name: 'B', left: Node(name: 'D'), right: Node(name: 'E')),
    right: Node(name: 'C', left: Node(name: 'F'), right: Node(name: 'G')),
  );
}
