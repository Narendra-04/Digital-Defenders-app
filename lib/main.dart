import 'package:flutter/material.dart';

// Controller
import 'modules/cyber_tips/tips_controller.dart';

// Routes
import 'routes/app_routes.dart';
import 'routes/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// 🔐 Load tips before app starts
  await TipsController.loadTipsFromJson();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digital Defenders',

      /// 🎨 Theme (can upgrade later)
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark, // 🔥 Hacker theme feel
      ),

      /// 🚀 Routing System
      initialRoute: AppRoutes.home,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}