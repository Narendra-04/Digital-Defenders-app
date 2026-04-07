import 'package:flutter/material.dart';

// Screens
import 'drawing_screen.dart';
import 'story_builder.dart';
import 'color_palette_screen.dart';

// Background
import '../../widgets/matrix_background.dart';

class CreativeZoneScreen extends StatelessWidget {
  const CreativeZoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// 🖤 Hacker Theme Background
      body: Stack(
        children: [

          /// Dark background
          Container(color: Colors.black),

          /// Matrix animation
          const MatrixBackground(),

          /// UI
          SafeArea(
            child: Column(
              children: [

                const SizedBox(height: 20),

                /// 🔥 Title
                Text(
                  "🎨 Creative Zone",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent,
                    shadows: [
                      Shadow(
                        blurRadius: 20,
                        color: Colors.green,
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    padding: const EdgeInsets.all(16),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,

                    children: [

                      _AnimatedCard(
                        title: "Drawing",
                        icon: Icons.brush,
                        color: Colors.pink,
                        screen: const DrawingScreen(),
                      ),

                      _AnimatedCard(
                        title: "Story Builder",
                        icon: Icons.menu_book,
                        color: Colors.green,
                        screen: const StoryBuilderScreen(),
                      ),

                      _AnimatedCard(
                        title: "Color Palette",
                        icon: Icons.palette,
                        color: Colors.orange,
                        screen: const ColorPaletteScreen(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 🎬 Animated Card
class _AnimatedCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Widget screen;

  const _AnimatedCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.screen,
  });

  @override
  State<_AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<_AnimatedCard>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      lowerBound: 0.9,
      upperBound: 1.0,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() async {
    await _controller.reverse();
    await _controller.forward();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => widget.screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _controller,
      child: GestureDetector(
        onTap: _onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: widget.color, width: 2),
            boxShadow: [
              BoxShadow(
                color: widget.color.withOpacity(0.8),
                blurRadius: 20,
                spreadRadius: 3,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Icon(widget.icon, size: 50, color: widget.color),

              const SizedBox(height: 10),

              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: widget.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}