import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  final String playerName;

  const GamePage({super.key, required this.playerName});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.playerName
        ),
      ),
    );
  }
}