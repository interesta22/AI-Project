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

  void runBFS() {
    final tree = buildTree();
    final goal = 'F';
    final res = bfsWithGoal(tree, goal);
    setState(() {
      result = res.join(' → ');
      selectedAlgorithm = 'BFS';
    });
  }

  void runDFS() {
    final tree = buildTreeOfDfs();
    final goal = 'F';
    final rightFirst = true;
    final res = dfsWithGoal(tree, goal, rightFirst: rightFirst);
    setState(() {
      result = res.join(' → ');
      selectedAlgorithm = 'DFS';
    });
  }

  void runGreedy() {
    final res = greedyExample();
    setState(() {
      result = res;
      selectedAlgorithm = 'Greedy';
    });
  }

  void runAStar() {
    final res = aStarExample();
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
              label: 'Run DFS (Tree)',
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
            ResultBox(result: result),
          ],
        ),
      ),
    );
  }
}