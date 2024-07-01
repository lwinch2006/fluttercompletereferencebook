import 'package:chapter18/pages/page3/copy_all_action.dart';
import 'package:chapter18/pages/page3/copy_all_intent.dart';
import 'package:chapter18/pages/page3/static_copyable_text.dart';
import 'package:chapter18/widgets/chapter18_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Page3 extends StatefulWidget {
  final String title;

  const Page3({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  final text = 'Hello World that can be copied';
  final FocusNode _containerFocusNode = FocusNode();
  Color? _bgColor;

  @override
  void dispose() {
    _containerFocusNode.dispose();
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
            const Text('Selectable text on Ctrl-C or mouse click event',
            style: TextStyle(fontStyle: FontStyle.italic),),
            const StaticSelectableText(text: 'Static selectable text'),
            const SizedBox(
              height: 50,
            ),
            const Text('Selectable text on just Ctrl-C event',
              style: TextStyle(fontStyle: FontStyle.italic),),
            FocusableActionDetector(
              onShowHoverHighlight: (isHovered) {
                if (isHovered) {
                  _containerFocusNode.requestFocus();
                } else {
                  _containerFocusNode.unfocus();
                }
              },
              shortcuts: <LogicalKeySet, Intent>{
                LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.keyC):
                    const SelectAllIntent(),
              },
              actions: <Type, Action<Intent>>{
                SelectAllIntent: SelectAllAction(context, text),
              },
              onFocusChange: (hasFocus) {
                setState(() {
                  _bgColor = hasFocus ? Colors.black12 : null;
                });
              },
              focusNode: _containerFocusNode,
              child: Container(
                width: 200,
                height: 50,
                color: _bgColor,
                child: Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Chapter18BottomNavigationBar(
          currentSelectedIndex: 3, context: context),
    );
  }
}
