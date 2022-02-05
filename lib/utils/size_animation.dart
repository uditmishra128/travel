import 'package:flutter/material.dart';

class SizeAnimation extends StatefulWidget {
  final Widget? child;
  const SizeAnimation({this.child, key}) : super(key: key);

  @override
  _SizeAnimationState createState() => _SizeAnimationState();
}

class _SizeAnimationState extends State<SizeAnimation> {
  final Tween<double> _scaleTween = Tween<double>(begin: 0, end: 1);
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        curve: Curves.easeIn,
        tween: _scaleTween,
        duration: const Duration(seconds: 2),
        builder: (context, scale, child) {
          return Transform.scale(scale: 1, child: child);
        },
        child: widget.child);
  }
}
