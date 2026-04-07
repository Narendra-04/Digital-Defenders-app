import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import '../../data/models/tip_model.dart';

class TipsController {

  static List<Tip> tips = [];

  /// Load tips from JSON
  static Future<void> loadTipsFromJson() async {

    final String response =
        await rootBundle.loadString('assets/data/tips.json');

    final List data = json.decode(response);

    tips = data.map((e) => Tip.fromJson(e)).toList();
  }

  /// Get random Tip
  static Tip getRandomTip() {

    if (tips.isEmpty) {
      return Tip(
        title: "Cyber Safety",
        description: "Stay safe online!",
      );
    }

    final random = Random();
    return tips[random.nextInt(tips.length)];
  }
}