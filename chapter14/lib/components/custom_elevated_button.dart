import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  const CustomElevatedButton({super.key});

  @override
  State<StatefulWidget> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final renderObject = context.findRenderObject();
      debugPrint('Is RenderBox: ${renderObject is RenderBox}');
    });
  }

  void _printSize(BuildContext context) {
    final RenderObject? renderBox = context.findRenderObject();

    if (renderBox is! RenderBox) {
      return;
    }

    final size = renderBox.size;
    debugPrint('Render object size: ${size.width}(w) x ${size.height}(h)');
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _printSize(context);
      },
      child: const Text('Click me'),
    );
  }
}
