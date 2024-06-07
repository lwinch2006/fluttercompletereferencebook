import 'dart:math' as math;

import 'package:chapter15/models/hero_tags.dart';
import 'package:chapter15/routes.dart';
import 'package:chapter15/widgets/chapter15_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page8 extends StatefulWidget {
  final String title;

  const Page8({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _Page8State();
}

class _Page8State extends State<Page8> with SingleTickerProviderStateMixin {
  final _container = Container(
    color: Colors.grey,
    width: 50,
    height: 50,
    margin: const EdgeInsets.all(5),
  );

  late final _animationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 1));

  late final _curvedAnimationController = CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceIn,
      reverseCurve: Curves.easeOut);

  late final _reversedAnimationController = ReverseAnimation(_animationController);

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Hero(
                tag: page8Page9TagHero,
                child: Image(image: AssetImage('assets/images/044.png'))),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  //context.push(page9Path);

                  context.pushNamed(page9Path);
                },
                child: const Text('To page 9')),
            const SizedBox(
              height: 10,
            ),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _animationController.value * math.pi / 2,
                  child: child,
                );
              },
              child: Container(
                width: 30,
                height: 30,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_animationController.isCompleted) {
                    _animationController.reverse();
                  } else {
                    _animationController.forward();
                  }
                },
                child: const Text('Custom animation')),
          ],
        ),
      ),
      bottomNavigationBar: Chapter15BottomNavigationBar(
          currentSelectedIndex: 8, context: context),
    );
  }
}
