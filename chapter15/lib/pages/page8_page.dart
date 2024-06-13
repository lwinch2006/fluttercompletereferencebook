import 'dart:math' as math;

import 'package:chapter15/models/hero_tags.dart';
import 'package:chapter15/routes.dart';
import 'package:chapter15/widgets/chapter15_border_transition.dart';
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

  late final _tween =
      _animationController.drive(Tween<double>(begin: 150, end: 315.8));

  late final _tweenWithRadians =
      _animationController.drive(Tween<double>(begin: 0, end: 0.25));

  late final _colorTween = _animationController
      .drive(Tween<Color>(begin: Colors.red, end: Colors.green));

  late final _offsetTween =
      Tween<Offset>(begin: const Offset(0, 0), end: const Offset(5, 5))
          .animate(_animationController);

  late final _alignmentTween = _animationController.drive(
      Tween<AlignmentGeometry>(
          begin: const Alignment(0, 0), end: const Alignment(1, 1)));

  late final _paddingTween1 = EdgeInsetsTween(
    begin: const EdgeInsets.only(left: 16),
    end: const EdgeInsets.only(left: 75),
  ).animate(_animationController);

  late final _paddingTween2 = Tween<EdgeInsets>(
    begin: const EdgeInsets.only(bottom: 16),
    end: const EdgeInsets.only(bottom: 75),
  ).animate(_animationController);

  late final _curvedAnimationController = CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceIn,
      reverseCurve: Curves.easeOut);

  late final _reversedAnimationController =
      ReverseAnimation(_animationController);

  double _targetAngle = 0.0;

  @override
  void initState() {
    super.initState();

    _animationController.addListener(() {
      debugPrint('Animation controller: ${_animationController.value}');
      debugPrint('Tween: ${_tween.value}');
    });
  }

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('AnimatedBuilder'),
                const SizedBox(
                  width: 10,
                ),
                AnimatedBuilder(
                  //animation: _animationController,
                  animation: _tween,
                  builder: (context, child) {
                    return Transform.rotate(
                      //angle: _animationController.value * math.pi / 2,
                      angle: _tween.value * math.pi / 180.0,
                      child: child,
                    );
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('SizeTransition'),
                const SizedBox(
                  width: 10,
                ),
                SizeTransition(
                  sizeFactor: _animationController,
                  child: Center(
                    child: Container(
                      color: Colors.lime,
                      height: 30,
                      child: const Text('Hello'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('ScaleTransition'),
                const SizedBox(
                  width: 10,
                ),
                ScaleTransition(
                  scale: _animationController,
                  child: const FlutterLogo(),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('RotationTransition'),
                const SizedBox(
                  width: 10,
                ),
                RotationTransition(
                  turns: _tweenWithRadians,
                  child: Container(
                    width: 30,
                    height: 30,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('SlideTransition'),
                const SizedBox(
                  width: 10,
                ),
                SlideTransition(
                  position: _offsetTween,
                  child: Container(
                    width: 30,
                    height: 30,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('FadeTransition'),
                const SizedBox(
                  width: 10,
                ),
                FadeTransition(
                  opacity: _animationController,
                  child: Container(
                    width: 30,
                    height: 30,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('AlignTransition'),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.yellow,
                  child: AlignTransition(
                    alignment: _alignmentTween,
                    child: const Text('Hi'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Combined animation'),
                const SizedBox(
                  width: 10,
                ),
                ScaleTransition(
                  scale: _animationController,
                  child: FadeTransition(
                    opacity: _animationController,
                    child: Container(
                      width: 30,
                      height: 30,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Padding'),
                const SizedBox(
                  width: 10,
                ),
                AnimatedBuilder(
                  animation: _paddingTween1,
                  builder: (context, child) {
                    return Padding(
                      padding: _paddingTween1.value,
                      child: child,
                    );
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Custom BorderTransition'),
                const SizedBox(
                  width: 10,
                ),
                Chapter15BorderTransition(
                  listenable: _animationController,
                  child: const Text('Hi'),
                ),
              ],
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
            const SizedBox(
              height: 10,
            ),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: _targetAngle),
              duration: const Duration(seconds: 1),
              builder: (context, value, _) {
                return Transform.rotate(
                  angle: value,
                  child: const FlutterLogo(),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _targetAngle = _targetAngle > 0 ? 0 : 2 * math.pi;
                });
              },
              child: const Text('Rotate logo'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Chapter15BottomNavigationBar(
          currentSelectedIndex: 8, context: context),
    );
  }
}
