import 'package:flutter/material.dart';
import '../data/models/tip_model.dart';
import '../data/services/tts_service.dart';

class TipPopupWidget extends StatefulWidget {
  final Tip tip;

  const TipPopupWidget({super.key, required this.tip});

  @override
  State<TipPopupWidget> createState() => _TipPopupWidgetState();
}

class _TipPopupWidgetState extends State<TipPopupWidget>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // 🎬 Animation setup
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut, // bounce effect
    );

    _controller.forward();

    // 🔊 Speak tip
    TTSService.speak(
      "${widget.tip.title}. ${widget.tip.description}",
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    TTSService.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.blue, Colors.purple],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.6),
                  blurRadius: 20,
                  spreadRadius: 5,
                )
              ],
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                /// Icon
                const Icon(
                  Icons.security,
                  size: 50,
                  color: Colors.white,
                ),

                const SizedBox(height: 10),

                /// Title
                Text(
                  widget.tip.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 10),

                /// Description
                Text(
                  widget.tip.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 20),

                /// Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    TTSService.stop();
                    Navigator.pop(context);
                  },
                  child: const Text("Got it! 👍"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}