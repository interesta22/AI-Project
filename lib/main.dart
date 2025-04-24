import 'package:ai_project/pages/home_page.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const AlgorithmApp());
}

class AlgorithmApp extends StatelessWidget {
  const AlgorithmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Algorithms Visualizer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}