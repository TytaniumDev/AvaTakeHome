import 'package:flutter/material.dart';

const animationDuration = Duration(milliseconds: 300);
const Curve animationCurve = Curves.easeInOutQuart;

class AnimatedText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  const AnimatedText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
  });

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  @override
  void didUpdateWidget(covariant AnimatedText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.text != widget.text) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: animationDuration,
      child: Text(
        widget.text,
        key: ValueKey(widget.text),
        style: widget.style,
        textAlign: widget.textAlign,
      ),
    );
  }
}
