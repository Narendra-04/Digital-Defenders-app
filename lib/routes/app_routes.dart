import 'package:flutter/material.dart';

// Screens
import '../modules/home/home_screen.dart';
import '../modules/creative_zone/creative_zone_screen.dart';
import '../modules/creative_zone/drawing_screen.dart';
import '../modules/creative_zone/story_builder.dart';
import '../modules/creative_zone/color_palette_screen.dart'; // ✅ ADD
import '../modules/quiz/quiz_screen.dart';
import '../modules/slides_audio/slides_screen.dart';
import '../modules/game/safe_unsafe_game.dart';
import '../modules/game/select_level_screen.dart';

class AppRoutes {

  /// ================= ROUTE NAMES =================

  static const home = '/';

  static const creativeZone = '/creative-zone';

  /// 🎨 Creative Sub Routes
  static const drawing = '/creative-zone/drawing';
  static const storyBuilder = '/creative-zone/story-builder';
  static const colorPalette = '/creative-zone/color-palette';

  /// Other Modules
  static const quiz = '/quiz';
  static const slides = '/slides';
  static const slidesAudio = '/slides-audio';

  static const game = '/game';
  static const cyberGame = '/cyber-game';

  /// ================= ROUTE MAPPING =================

  static Map<String, WidgetBuilder> routes = {

    /// Home
    home: (context) => const HomeScreen(),

    /// Creative Zone
    creativeZone: (context) => const CreativeZoneScreen(),

    /// 🎨 Creative Features
    drawing: (context) => const DrawingScreen(),
    storyBuilder: (context) => const StoryBuilderScreen(),
    colorPalette: (context) => const ColorPaletteScreen(),

    /// Other Modules
    quiz: (context) => const QuizScreen(),
    slides: (context) => const SlidesScreen(),
    slidesAudio: (context) => const SlidesScreen(),

    /// Games
    game: (context) => const SafeUnsafeGame(),
    cyberGame: (context) => const SelectLevelScreen(),
  };
}