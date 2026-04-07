import 'package:flutter/material.dart';

class StoryBuilderScreen extends StatefulWidget {
  const StoryBuilderScreen({super.key});

  @override
  State<StoryBuilderScreen> createState() => _StoryBuilderScreenState();
}

class _StoryBuilderScreenState extends State<StoryBuilderScreen> {

  final controller = TextEditingController();
  List<String> stories = [];

  void addStory() {
    if (controller.text.isNotEmpty) {
      setState(() {
        stories.add(controller.text);
        controller.clear();
      });
    }
  }

  void delete(int index) {
    setState(() => stories.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Story Builder 📖")),

      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Write your cyber story...",
                border: OutlineInputBorder(),
              ),
            ),
          ),

          ElevatedButton(
            onPressed: addStory,
            child: const Text("Add Story"),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: stories.length,
              itemBuilder: (_, i) {
                return Card(
                  child: ListTile(
                    title: Text(stories[i]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => delete(i),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}