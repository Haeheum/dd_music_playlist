import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const apiKey = 'AIzaSyCBpA_Ij4urqGOptMIGGuHW0QG6VfkPmGY';
const playlistId = 'PLZBpWYucMEG9NG-YWc8VvroYLxuO0_dkd';
const kind = 'youtube#video';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Selector<>
      ),
    );
  }
}
