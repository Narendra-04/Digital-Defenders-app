import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Defenders',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const HomeScreen(),
    const CyberTipsScreen(),
    const CreativeZoneScreen(),
    const SlidesAudioScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Defenders'),
        centerTitle: true,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.lightbulb), label: 'Cyber Tips'),
          BottomNavigationBarItem(icon: Icon(Icons.brush), label: 'Creative Zone'),
          BottomNavigationBarItem(icon: Icon(Icons.slideshow), label: 'Slides + Audio'),
        ],
      ),
    );
  }
}

// 🏠 Home Screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Welcome to Digital Defenders!',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// 💡 Cyber Tips
class CyberTipsScreen extends StatelessWidget {
  const CyberTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Cyber Tips Module Coming Soon',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

// 🎨 Creative Zone
class CreativeZoneScreen extends StatelessWidget {
  const CreativeZoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Creative Zone Coming Soon',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

// 🎤 Image Slides + Audio
class SlidesAudioScreen extends StatelessWidget {
  const SlidesAudioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Image Slides + Audio Module Coming Soon',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
