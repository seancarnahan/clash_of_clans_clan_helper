import 'dart:async';
import 'package:flutter/material.dart';

class AnimatedTypingText extends StatefulWidget {
  final String text;
  final String placeHolderText;

  AnimatedTypingText({required this.text, required this.placeHolderText});

  @override
  _AnimatedTypingTextState createState() => _AnimatedTypingTextState();
}

class _AnimatedTypingTextState extends State<AnimatedTypingText> {
  String _displayedText = "";
  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 50), (Timer timer) {
      if (_currentIndex < widget.text.length) {
        setState(() {
          _displayedText += widget.text[_currentIndex];
          _currentIndex++;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isTextEmpty = widget.text.isEmpty;
    String text = isTextEmpty ? widget.placeHolderText : _displayedText;
    return Text(
      text,
      style: TextStyle(
        fontSize: 16.0,
        color: isTextEmpty ? Colors.grey : Colors.black,
      )
    );
  }
}
