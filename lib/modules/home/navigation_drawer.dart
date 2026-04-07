import 'package:flutter/material.dart';
import 'package:digital_defenders/routes/app_routes.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text("Digital Defenders", style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          _buildItem(context, "Home", AppRoutes.home),
          _buildItem(context, "Creative Zone", AppRoutes.creativeZone),
          _buildItem(context, "Slides + Audio", AppRoutes.slides),
          _buildItem(context, "Quiz", AppRoutes.quiz),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
