import 'package:ai_project/models/node_mpdel.dart';

List<String> dfsWithGoal(Node root, String goal, {bool rightFirst = false}) {
  List<String> result = [];
  Set<String> visited = {};
  bool foundGoal = false; // علم لمعرفة إذا تم العثور على الهدف

  void dfs(Node? node) {
    if (node == null || visited.contains(node.name) || foundGoal) return;

    visited.add(node.name);
    result.add(node.name);

    if (node.name == goal) {
      foundGoal = true; // إذا وجدنا الهدف، نوقف البحث بعد هذه العقدة
      return;
    }

    // إذا كان rightFirst صحيحًا، نبدأ أولًا بالبحث في الفرع الأيمن
    if (rightFirst) {
      dfs(node.right);
      dfs(node.left);
    } else {
      // إذا كان rightFirst خاطئًا، نبدأ أولًا بالبحث في الفرع الأيسر
      dfs(node.left);
      dfs(node.right);
    }
  }

  dfs(root);
  return result;
}

Node buildTreeOfDfs() {
  return Node(
    name: 'A',
    left: Node(name: 'B', left: Node(name: 'D'), right: Node(name: 'E')),
    right: Node(name: 'C', left: Node(name: 'F'), right: Node(name: 'G')),
  );
}

