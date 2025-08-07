import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Defenders'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Welcome to Digital Defenders!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text('Learn about Cyber Safety in a fun way!'),
          ],
        ),
      ),
    );
  }
}
