String aStarExample() {
  // خوارزمية A* (A Star)
  final start = 'A';
  final goal = 'J';

  // الجراف (graph) مع المسافات (distances)
  final graph = {
    'A': {'B': 6, 'C': 3},
    'B': {'E': 2, 'D': 3},
    'C': {'G': 1, 'F': 7},
    'D': {'E': 1, 'F': 5},
    'E': {'F': 8},
    'F': {'I': 5, 'J': 5},
    'G': {'I': 3},
    'H': {'I': 2},
    'I': {'J': 3},
  };

  // تقدير المسافات من البداية (start) إلى الهدف (goal)
  final heuristic = {
    'A': 10,
    'B': 8,
    'C': 6,
    'D': 5,
    'E': 7,
    'F': 3,
    'G': 5,
    'H': 3,
    'I': 1,
    'J': 0,
  };

  // القيم المبدئية
  final gScore = {start: 0};
  final fScore = {start: heuristic[start]};

  // القوائم المساعدة
  final openSet = [start];
  final cameFrom = {};

  while (openSet.isNotEmpty) {
    // اختيار العقدة ذات أقل قيمة fScore
    var current = openSet.reduce((a, b) => fScore[a]! < fScore[b]! ? a : b);

    // إذا وصلنا إلى الهدف
    if (current == goal) {
      List<String> path = [];
      while (cameFrom.containsKey(current)) {
        path.add(current);
        current = cameFrom[current]!;
      }
      path.add(start);
      return 'Path: ${path.reversed.join(' → ')}';
    }

    openSet.remove(current);

    // التحقق من الجيران
    for (var neighbor in graph[current]!.keys) {
      final tentativeGScore = gScore[current]! + graph[current]![neighbor]!;
      if (tentativeGScore < (gScore[neighbor] ?? double.infinity)) {
        cameFrom[neighbor] = current;
        gScore[neighbor] = tentativeGScore;
        fScore[neighbor] = tentativeGScore + heuristic[neighbor]!;
        if (!openSet.contains(neighbor)) {
          openSet.add(neighbor);
        }
      }
    }
  }

  return 'No path found';
}