import 'package:flutter/material.dart';
import '../algorithms/bfs.dart';
import '../algorithms/dfs.dart';
import '../algorithms/greedy.dart';
import '../algorithms/a_star.dart';
import '../widgets/CustomElevatedButton.dart';
import '../widgets/resuil_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = '';
  String selectedAlgorithm = '';

  void runDFS() {
    final tree = buildTreeOfDfs();
    final goal = 'F';
    final rightFirst = true;
    final res = dfsWithGoal(tree, goal, rightFirst: rightFirst);
    setState(() {
      result = res.first; 
      selectedAlgorithm = 'DFS';
    });
  }

  void runBFS() {
    final tree = buildTree();
    final goal = 'F';
    final res = bfsWithGoal(tree, goal);
    setState(() {
      result = res;
      selectedAlgorithm = 'BFS';
    });
  }

  void runGreedy() {
    final String start = 'A';
    final String goal = 'J';
    final res = greedyExample(start, goal);
    setState(() {
      result = res;
      selectedAlgorithm = 'Greedy';
    });
  }

  void runAStar() {
    final start = 'A';
    final goal = 'J';
    final res = aStarExample(start, goal);
    setState(() {
      result = res;
      selectedAlgorithm = 'A*';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Algorithms Visualizer')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomElevatedButton(
              label: 'Run BFS',
              onPressed: runBFS,
              isSelected: selectedAlgorithm == 'BFS',
            ),
            const SizedBox(height: 10),
            CustomElevatedButton(
              label: 'Run DFS',
              onPressed: runDFS,
              isSelected: selectedAlgorithm == 'DFS',
            ),
            const SizedBox(height: 10),
            CustomElevatedButton(
              label: 'Run Greedy',
              onPressed: runGreedy,
              isSelected: selectedAlgorithm == 'Greedy',
            ),
            const SizedBox(height: 10),
            CustomElevatedButton(
              label: 'Run A*',
              onPressed: runAStar,
              isSelected: selectedAlgorithm == 'A*',
            ),
            const SizedBox(height: 20),
            Center(child: const Text('Result', style: TextStyle(fontSize: 18))),
            ResultBox(result: result),
          ],
        ),
      ),
    );
  }
}
