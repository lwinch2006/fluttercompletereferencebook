import 'package:chapter14/components/chapter14_bottom_navigation_bar.dart';
import 'package:chapter14/components/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Page9 extends StatefulWidget {
  final String title;

  const Page9({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _Page9State();
}

class _Page9State extends State<Page9> {
  final _textKey = GlobalKey();
  final _layerLink = LayerLink();

  OverlayEntry? _overlayEntry;

  removePopup() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  void _showOverlay() {
    final renderObject = _textKey.currentContext?.findRenderObject();

    removePopup();

    if (renderObject is! RenderBox) {
      return;
    }

    final position = renderObject.globalToLocal(Offset.zero);
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: 0,
          right: 0,
          top: position.dy.abs(),
          child: CompositedTransformFollower(
            link: _layerLink,
            followerAnchor: Alignment.topCenter,
            targetAnchor: Alignment.topCenter,
            offset: const Offset(0, 25),
            child: const SizedBox(
              width: 100,
              height: 50,
              child: ColoredBox(color: Colors.amberAccent,),
            ),
          ),
        );
      },
    );

    Overlay.of(_textKey.currentContext!).insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Overlays and Target/Follower'),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: _showOverlay,
                child: const Text('Click me'),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: SizedBox(
                    width: 300,
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 1800,
                        ),
                        CompositedTransformTarget(
                          link: _layerLink,
                          child: Text(
                            'Hello World',
                            key: _textKey,
                          ),
                        ),
                        const SizedBox(
                          height: 1800,
                        ),
                      ],
                    )),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      )),
      bottomNavigationBar: Chapter14BottomNavigationBar(
          currentSelectedIndex: 9, context: context),
    );
  }
}
