String greedyExample() {
  final Map<String, List<String>> graph = {
    // 'A': ['B', 'C'],
    // 'B': ['D', 'F'],
    // 'C': ['G', 'H'],
    // 'D': [],
    // 'E': ['J'],
    // 'F': ['E'],
    // 'G': ['i'],
    // 'H': [],
    // 'I': ['J'],
    // 'J': [],
    'A': ['B', 'C','B'],
    'B': ['E', 'F'],
    'C': ['G'],
    'D': ['H'],
    'E': ['I'],
    'F': ['J'],
    'G': [],
    'H': ['J'],
    'I': ['J'],
    'J': [],
  };

  final Map<String, int> heuristics = {
    // 'A': 40,
    // 'B': 32,
    // 'C': 30,
    // 'D': 13,
    // 'E': 10,
    // 'F': 24,
    // 'G': 33,
    // 'H': 29,
    // 'I': 20,
    // 'J': 0,
    'A': 15,
    'B': 13,
    'C': 9,
    'D': 14,
    'E': 15,
    'F': 7,
    'G': 5,
    'H': 11,
    'I': 9,
    'J': 0,
  };

  final visited = <String>{};
  final result = <String>[];
  final queue = <String>[];

  String start = 'A';
  String goal = 'J';

  queue.add(start);

  while (queue.isNotEmpty) {
    // نرتب الطابور حسب الهيريستيك
    queue.sort((a, b) => heuristics[a]!.compareTo(heuristics[b]!));
    String current = queue.removeAt(0);

    if (visited.contains(current)) continue;

    visited.add(current);
    result.add(current);

    if (current == goal) break;

    final neighbors = graph[current] ?? [];
    for (String neighbor in neighbors) {
      if (!visited.contains(neighbor)) {
        queue.add(neighbor);
      }
    }
  }

  return result.join(' → ');
}