import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'game_level.dart';

class CyberDefenderGame extends StatefulWidget {
  final GameLevel level;

  const CyberDefenderGame({super.key, required this.level});

  @override
  State<CyberDefenderGame> createState() => _CyberDefenderGameState();
}

class _CyberDefenderGameState extends State<CyberDefenderGame> {

  int score = 0;
  bool gameOver = false;

  double x = 100;
  double y = -100;

  Timer? timer;
  final random = Random();

  Map item = {};

  List<Map> items = [];
  int speed = 5;

  @override
  void initState() {
    super.initState();
    setupLevel();
    startGame();
  }

  /// 🔥 Set Difficulty
  void setupLevel() {
    switch (widget.level) {

      case GameLevel.beginner:
        items = [
          {"text": "🔐 Password", "safe": true},
          {"text": "❌ Share Password", "safe": false},
        ];
        speed = 4;
        break;

      case GameLevel.intermediate:
        items = [
          {"text": "📩 Phishing", "safe": false},
          {"text": "🛡 Antivirus", "safe": true},
        ];
        speed = 6;
        break;

      case GameLevel.advanced:
        items = [
          {"text": "💰 Fake Offer", "safe": false},
          {"text": "🔒 2FA", "safe": true},
        ];
        speed = 8;
        break;
    }
  }

  void startGame() {
    spawn();

    timer = Timer.periodic(const Duration(milliseconds: 50), (t) {
      setState(() {
        y += speed;

        if (y > MediaQuery.of(context).size.height) {
          gameOver = true;
          timer?.cancel();
        }
      });
    });
  }

  void spawn() {
    y = -100;
    x = random.nextDouble() * 250;
    item = items[random.nextInt(items.length)];
  }

  void tapItem() {
    if (item["safe"]) {
      score++;
      spawn();
    } else {
      gameOver = true;
      timer?.cancel();
    }
  }

  void restart() {
    setState(() {
      score = 0;
      gameOver = false;
    });
    startGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cyber Game (${widget.level.name})"),
      ),

      body: Stack(
        children: [

          Positioned(
            top: 20,
            left: 20,
            child: Text("Score: $score"),
          ),

          Positioned(
            top: y,
            left: x,
            child: GestureDetector(
              onTap: tapItem,
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.black,
                child: Text(
                  item["text"] ?? "",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),

          if (gameOver)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Game Over"),
                  Text("Score: $score"),
                  ElevatedButton(
                    onPressed: restart,
                    child: const Text("Restart"),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}