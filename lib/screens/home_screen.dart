import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Defenders'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildModuleCard(
              context,
              title: "Daily Cyber Tips",
              icon: Icons.shield,
              routeName: "/tips",
            ),
            buildModuleCard(
              context,
              title: "Creative Zone",
              icon: Icons.brush,
              routeName: "/creative",
            ),
            buildModuleCard(
              context,
              title: "Image Slides + Narration",
              icon: Icons.slideshow,
              routeName: "/slides",
            ),
          ],
        ),
      ),
    );
  }

  Widget buildModuleCard(BuildContext context,
      {required String title,
      required IconData icon,
      required String routeName}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, size: 30, color: Colors.deepPurple),
        title: Text(title, style: const TextStyle(fontSize: 18)),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
      ),
    );
  }
}
