import 'package:chapter18/pages/page3/copy_all_action.dart';
import 'package:chapter18/pages/page3/copy_all_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StaticSelectableText extends StatefulWidget {
  final String text;

  const StaticSelectableText({super.key, required this.text});

  @override
  State<StatefulWidget> createState() => _StaticSelectableTextState();
}

class _StaticSelectableTextState extends State<StaticSelectableText> {
  Color? _bgColor;

  final FocusNode _containerFocusNode = FocusNode();

  @override
  void dispose() {
    _containerFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        _containerFocusNode.requestFocus();
      },
      onExit: (event) {
        _containerFocusNode.unfocus();
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          debugPrint('Tapped');
          SelectAllAction(context, widget.text).invoke(const SelectAllIntent());
        },
        child: Shortcuts(
          shortcuts: <LogicalKeySet, Intent>{
            LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.keyC):
                const SelectAllIntent(),
          },
          child: Actions(
              actions: <Type, Action<Intent>>{
                SelectAllIntent: SelectAllAction(context, widget.text),
              },
              // Actions and keyboard commands only work if child has focus
              child: Focus(
                focusNode: _containerFocusNode,
                onFocusChange: (hasFocus) {
                  setState(() {
                    _bgColor = hasFocus ? Colors.black12 : null;
                  });
                },
                child: Container(
                  width: 200,
                  height: 50,
                  color: _bgColor,
                  child: Center(
                    child: Text(widget.text),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
