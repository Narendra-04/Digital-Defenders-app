import 'package:flutter/material.dart';

class SlidesScreen extends StatefulWidget {
  const SlidesScreen({super.key});

  @override
  State<SlidesScreen> createState() => _SlidesScreenState();
}

class _SlidesScreenState extends State<SlidesScreen> {

  int index = 0;

  final List<Map<String, String>> slides = [

    {
      "title": "Strong Passwords",
      "text": "Use strong passwords with numbers and symbols."
    },

    {
      "title": "Do Not Share OTP",
      "text": "Never share your OTP with anyone."
    },

    {
      "title": "Avoid Unknown Links",
      "text": "Do not click suspicious links."
    },
  ];

  void nextSlide() {
    setState(() {
      if (index < slides.length - 1) {
        index++;
      }
    });
  }

  void previousSlide() {
    setState(() {
      if (index > 0) {
        index--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    var slide = slides[index];

    return Scaffold(
      appBar: AppBar(title: const Text("Cyber Safety Slides")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              slide["title"]!,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Text(
              slide["text"]!,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                ElevatedButton(
                  onPressed: previousSlide,
                  child: const Text("Previous"),
                ),

                ElevatedButton(
                  onPressed: nextSlide,
                  child: const Text("Next"),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}