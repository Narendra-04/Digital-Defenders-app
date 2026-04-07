import 'package:flutter/material.dart';

// Screens
import '../modules/home/home_screen.dart';
import '../modules/creative_zone/creative_zone_screen.dart';
import '../modules/creative_zone/drawing_screen.dart';
import '../modules/creative_zone/story_builder.dart';
import '../modules/quiz/quiz_screen.dart';
import '../modules/slides_audio/slides_screen.dart';
import '../modules/game/safe_unsafe_game.dart';
import '../modules/game/select_level_screen.dart'; // ✅ ADD

import 'app_routes.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {

      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case AppRoutes.creativeZone:
        return MaterialPageRoute(builder: (_) => const CreativeZoneScreen());

      case AppRoutes.drawing:
        return MaterialPageRoute(builder: (_) => const DrawingScreen());

      case AppRoutes.storyBuilder:
        return MaterialPageRoute(builder: (_) => const StoryBuilderScreen());

      case AppRoutes.quiz:
        return MaterialPageRoute(builder: (_) => const QuizScreen());

      case AppRoutes.slides:
      case AppRoutes.slidesAudio:
        return MaterialPageRoute(builder: (_) => const SlidesScreen());

      /// 🎮 Game
      case AppRoutes.game:
        return MaterialPageRoute(builder: (_) => const SafeUnsafeGame());

      /// 🛡 FIXED (Cyber Game)
      case AppRoutes.cyberGame:
        return MaterialPageRoute(
          builder: (_) => const SelectLevelScreen(),
        );

      /// ❌ Default
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(
                '404 - Page Not Found',
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),
          ),
        );
    }
  }
}