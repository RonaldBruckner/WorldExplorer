import 'dart:async';

import 'package:flutter/cupertino.dart';

class LanguageFader extends StatefulWidget {
  final List<String> languages;
  final Duration displayDuration;

  const LanguageFader({
    super.key,
    required this.languages,
    this.displayDuration = const Duration(seconds: 2),
  });

  @override
  State<LanguageFader> createState() => _LanguageFaderState();
}

class _LanguageFaderState extends State<LanguageFader> {
  int _currentIndex = 0;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    if (widget.languages.isNotEmpty) {
      _timer = Timer.periodic(widget.displayDuration, (_) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % widget.languages.length;
        });
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: Text(
        '🗣️ ${widget.languages[_currentIndex]}',
        key: ValueKey(_currentIndex), // Required for switch animation
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}