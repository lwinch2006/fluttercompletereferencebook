import 'package:chapter15/widgets/chapter15_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class Page7 extends StatefulWidget {
  final String title;

  const Page7({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _Page7State();
}

class _Page7State extends State<Page7> {
  AlignmentGeometry _alignment = Alignment.bottomLeft;
  bool _isAnimatedAlign = false;
  bool _isAnimatedContainer = false;
  bool _isAnimatedPositioned = false;
  bool _isAnimatedCrossFade = false;

  Widget _animatedSwitcherChild = const Text('Text');

  bool _isAnimatedDefaultTextStyle = false;
  Color _animatedDefaultTextStyleColor = Colors.green;
  double _animatedDefaultTextStyleSize = 14;

  bool _isAnimatedOpacity = false;
  double _animatedOpacityValue = 1;

  bool _isAnimatedPadding = false;
  EdgeInsets _animatedPaddingValue = EdgeInsets.zero;

  double _animatedRotationAngle = 0;

  double _animatedScaleValue = 1;

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
            AnimatedAlign(
              alignment: _alignment,
              duration: const Duration(seconds: 1),
              child: ElevatedButton(
                child: const Text('AnimatedAlign'),
                onPressed: () {
                  setState(() {
                    _isAnimatedAlign = !_isAnimatedAlign;

                    if (_isAnimatedAlign) {
                      _alignment = Alignment.center;
                    } else {
                      _alignment = Alignment.bottomLeft;
                    }
                  });
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: _isAnimatedContainer ? 250.0 : 200.0,
              height: _isAnimatedContainer ? 120.0 : 60.0,
              color: _isAnimatedContainer ? Colors.red : Colors.green,
              child: Center(
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isAnimatedContainer = !_isAnimatedContainer;
                      });
                    },
                    child: const Text('AnimatedContainer')),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(seconds: 1),
                    right: _isAnimatedPositioned ? 200.0 : 0.0,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isAnimatedPositioned = !_isAnimatedPositioned;
                        });
                      },
                      child: const Text('AnimatedPositioned'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: AnimatedCrossFade(
                  firstChild: ElevatedButton(
                      style: const ButtonStyle(
                          fixedSize:
                              MaterialStatePropertyAll<Size>(Size(200, 30))),
                      onPressed: () {
                        setState(() {
                          _isAnimatedCrossFade = !_isAnimatedCrossFade;
                        });
                      },
                      child: const Text('Switch to second')),
                  secondChild: ElevatedButton(
                      style: const ButtonStyle(
                          fixedSize:
                              MaterialStatePropertyAll<Size>(Size(200, 30))),
                      onPressed: () {
                        setState(() {
                          _isAnimatedCrossFade = !_isAnimatedCrossFade;
                        });
                      },
                      child: const Text('Switch to first')),
                  crossFadeState: _isAnimatedCrossFade
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(seconds: 1)),
            ),
            SizedBox(
                width: 300,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(seconds: 1),
                      transitionBuilder: (child, animation) {
                        return child;
                      },
                      child: _animatedSwitcherChild,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _animatedSwitcherChild =
                                _animatedSwitcherChild is Text
                                    ? const Icon(Icons.add)
                                    : const Text('Text');
                          });
                        },
                        child: const Text('AnimatedSwitcher'))
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedDefaultTextStyle(
                  style: TextStyle(
                    color: _animatedDefaultTextStyleColor,
                    fontSize: _animatedDefaultTextStyleSize,
                  ),
                  duration: const Duration(seconds: 1),
                  child: const Text('Text'),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isAnimatedDefaultTextStyle =
                            !_isAnimatedDefaultTextStyle;

                        if (_isAnimatedDefaultTextStyle) {
                          _animatedDefaultTextStyleColor = Colors.red;
                          _animatedDefaultTextStyleSize = 24;
                        } else {
                          _animatedDefaultTextStyleColor = Colors.green;
                          _animatedDefaultTextStyleSize = 14;
                        }
                      });
                    },
                    child: const Text('AnimatedDefaultTextStyle')),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            AnimatedOpacity(
              opacity: _animatedOpacityValue,
              duration: const Duration(seconds: 1),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isAnimatedOpacity = !_isAnimatedOpacity;
                      _animatedOpacityValue = _isAnimatedOpacity ? 0.25 : 1;
                    });
                  },
                  child: const Text('AnimatedOpacity')),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Left'),
                AnimatedPadding(
                  padding: _animatedPaddingValue,
                  duration: const Duration(seconds: 1),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isAnimatedPadding = !_isAnimatedPadding;
                          _animatedPaddingValue = _isAnimatedPadding
                              ? const EdgeInsets.all(20)
                              : EdgeInsets.zero;
                        });
                      },
                      child: const Text('AnimatedPadding')),
                ),
                const Text('Right'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedRotation(
                  turns: _animatedRotationAngle,
                  duration: const Duration(seconds: 1),
                  child: const Text('Hi'),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _animatedRotationAngle += 0.25;
                    });
                  },
                  child: const Text('AnimatedRotation'),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedScale(
                  scale: _animatedScaleValue,
                  duration: const Duration(seconds: 1),
                  child: const Text('Hi'),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _animatedScaleValue = _animatedScaleValue == 1 ? 2 : 1;
                      });
                    },
                    child: const Text('AnimatedScale')),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Chapter15BottomNavigationBar(
          currentSelectedIndex: 7, context: context),
    );
  }
}
