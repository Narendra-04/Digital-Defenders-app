import 'package:flutter/material.dart';

class SafeUnsafeGame extends StatefulWidget {
  const SafeUnsafeGame({super.key});

  @override
  State<SafeUnsafeGame> createState() => _SafeUnsafeGameState();
}

class _SafeUnsafeGameState extends State<SafeUnsafeGame> {

  int score = 0;

  List<Map<String, dynamic>> items = [
    {"text": "Share Password", "safe": false},
    {"text": "Use Strong Password", "safe": true},
    {"text": "Click Unknown Links", "safe": false},
    {"text": "Install Antivirus", "safe": true},
    {"text": "Talk to Strangers Online", "safe": false},
  ];

  List<Map<String, dynamic>> remainingItems = [];

  @override
  void initState() {
    super.initState();
    remainingItems = List.from(items);
  }

  void checkAnswer(bool isSafeDrop, Map item) {
    bool correct = item["safe"] == isSafeDrop;

    if (correct) {
      score++;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("✅ Correct!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("❌ Wrong!")),
      );
    }

    setState(() {
      remainingItems.remove(item);
    });
  }

  void restartGame() {
    setState(() {
      remainingItems = List.from(items);
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    /// Game Completed
    if (remainingItems.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text("Game Result")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("🎉 Game Completed!", style: TextStyle(fontSize: 24)),
              const SizedBox(height: 20),
              Text("Score: $score / ${items.length}",
                  style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: restartGame,
                child: const Text("Play Again"),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Safe vs Unsafe Game")),

      body: Column(
        children: [

          const SizedBox(height: 20),

          /// Draggable Item
          Expanded(
            child: Center(
              child: Draggable<Map>(
                data: remainingItems.first,
                feedback: _buildCard(remainingItems.first["text"]),
                childWhenDragging: const SizedBox(),
                child: _buildCard(remainingItems.first["text"]),
              ),
            ),
          ),

          /// Drop Zones
          Row(
            children: [

              /// SAFE
              Expanded(
                child: DragTarget<Map>(
                  onAccept: (item) => checkAnswer(true, item),
                  builder: (context, candidateData, rejectedData) {
                    return _buildZone("SAFE 🟢", Colors.green);
                  },
                ),
              ),

              /// UNSAFE
              Expanded(
                child: DragTarget<Map>(
                  onAccept: (item) => checkAnswer(false, item),
                  builder: (context, candidateData, rejectedData) {
                    return _buildZone("UNSAFE 🔴", Colors.red);
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildCard(String text) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(text, style: const TextStyle(fontSize: 18)),
      ),
    );
  }

  Widget _buildZone(String label, Color color) {
    return Container(
      height: 120,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color, width: 2),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(fontSize: 20, color: color),
        ),
      ),
    );
  }
}