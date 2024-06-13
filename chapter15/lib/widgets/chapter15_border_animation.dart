import 'package:flutter/material.dart';

class Chapter15BorderAnimation extends StatelessWidget {
  final AnimationController animationController;
  final Widget? child;

  const Chapter15BorderAnimation(
      {super.key, required this.animationController, this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.yellow,
              border: Border.all(
                color: Colors.blue,
                width: animationController.value * 3 + 1,
              )),
          child: child,
        );
      },
    );
  }
}
