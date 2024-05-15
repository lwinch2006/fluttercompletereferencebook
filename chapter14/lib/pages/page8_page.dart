import 'package:chapter14/components/chapter14_bottom_navigation_bar.dart';
import 'package:chapter14/components/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Page8 extends StatefulWidget {
  final String title;

  const Page8({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _Page8State();
}

class _Page8State extends State<Page8> {

  final _textKeys = List<GlobalKey>.generate(4, (index) => GlobalKey());

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
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('RenderBox'),
              SizedBox(
                height: 20,
              ),
              Flexible(
                child: SizedBox(width: 300, child: CustomElevatedButton()),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('RenderAbstractViewport'),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    final renderObject = _textKeys.last.currentContext?.findRenderObject();
                    if (renderObject == null) {
                      return;
                    }

                    final viewport = RenderAbstractViewport.of(renderObject);
                    final distance = viewport.getOffsetToReveal(renderObject, 0);
                    debugPrint('Scroll offset: ${distance.offset}');

                    if (viewport is RenderViewport) {
                      debugPrint('Scroll direction: ${viewport.axis}');
                      debugPrint('Item size: ${viewport.size}');
                      debugPrint('Has visual overflow: ${viewport.hasVisualOverflow}');
                    }
                  },
                  child: const Text('Scroll distance to Item 4')
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: SizedBox(width: 300,
                    child: ListView(
                      itemExtent: 30,
                      children: [
                        Text('Item 1', key: _textKeys[0]),
                        Text('Item 2', key: _textKeys[1]),
                        Text('Item 3', key: _textKeys[2]),
                        Text('Item 4', key: _textKeys[3]),
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
          currentSelectedIndex: 8, context: context),
    );
  }
}
