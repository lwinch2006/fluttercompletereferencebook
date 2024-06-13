import 'package:flutter/material.dart';

class Chapter15BorderTransition extends AnimatedWidget {
  final Widget? child;

  const Chapter15BorderTransition(
      {super.key, required super.listenable, this.child});

  Animation<double> get _border => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          color: Colors.yellow,
          border:
              Border.all(color: Colors.blue, width: _border.value * 3 + 1)),
      child: child,
    );
  }
}
