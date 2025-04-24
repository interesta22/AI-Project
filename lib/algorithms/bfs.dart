
import 'package:ai_project/models/node_mpdel.dart';

List<String> bfsWithGoal(Node root, String goal) {
  List<String> result = [];
  Set<String> visited = {};
  List<Node> queue = [root];  // استخدام قائمة للطابور بدلاً من الخريطة

  bool foundGoal = false; // علم لمعرفة إذا تم العثور على الهدف

  while (queue.isNotEmpty && !foundGoal) {
    Node node = queue.removeAt(0);  // أخذ أول عنصر من الطابور
    if (!visited.contains(node.name)) {
      visited.add(node.name);
      result.add(node.name);

      if (node.name == goal) {
        foundGoal = true;  // إذا وجدنا الهدف نوقف البحث
      } else {
        // إضافة الأبناء (الأطفال) إلى الطابور
        if (node.left != null) queue.add(node.left!);
        if (node.right != null) queue.add(node.right!);
      }
    }
  }

  return result;
}

Node buildTree() {
  return Node(
    name: 'A',
    left: Node(name: 'B', left: Node(name: 'D'), right: Node(name: 'E')),
    right: Node(name: 'C', left: Node(name: 'F'), right: Node(name: 'G')),
  );
}

