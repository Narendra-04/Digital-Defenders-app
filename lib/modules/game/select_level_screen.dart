import 'package:flutter/material.dart';
import 'cyber_defender_game.dart';
import 'game_level.dart';

class SelectLevelScreen extends StatelessWidget {
  const SelectLevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Level")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            _button(context, "Kids (Easy)", GameLevel.beginner),
            _button(context, "Teens (Medium)", GameLevel.intermediate),
            _button(context, "Adults (Hard)", GameLevel.advanced),

          ],
        ),
      ),
    );
  }

  Widget _button(BuildContext context, String text, GameLevel level) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CyberDefenderGame(level: level),
            ),
          );
        },
        child: Text(text),
      ),
    );
  }
}