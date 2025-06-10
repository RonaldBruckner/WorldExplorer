import 'package:flutter/material.dart';

class BackgroundScaffold extends StatelessWidget {
  final Widget child;
  final bool applyOverlay;

  const BackgroundScaffold({
    super.key,
    required this.child,
    this.applyOverlay = true, required String title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/splash.png',
            fit: BoxFit.cover,
          ),
          if (applyOverlay)
            Container(
              color: Colors.white.withOpacity(0.75),
            ),
          child,
        ],
      ),
    );
  }
}
