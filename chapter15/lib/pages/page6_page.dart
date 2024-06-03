import 'package:chapter15/widgets/chapter15_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as dart_ui;

class Page6 extends StatefulWidget {
  final String title;

  const Page6({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _Page6State();
}

class _Page6State extends State<Page6> {
  late final loadImageFuture = loadAssetImage();

  Future<dart_ui.Image> loadAssetImage() async {
    final bundle = DefaultAssetBundle.of(context);
    final image = await bundle.load('assets/images/044.png');
    return decodeImageFromList(image.buffer.asUint8List());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dart_ui.Image>(
      future: loadImageFuture,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text(widget.title),
            ),
            body: Center(
              child: CustomPaint(
                size: const Size(50, 50),
                painter: _Chapter15CustomPainter(image: snapshot.data!),
              ),
            ),
            bottomNavigationBar: Chapter15BottomNavigationBar(
                currentSelectedIndex: 6, context: context),
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}

class _Chapter15CustomPainter extends CustomPainter {
  final dart_ui.Image image;
  const _Chapter15CustomPainter({required this.image});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(image, Offset.zero, Paint());
  }

  @override
  bool shouldRepaint(covariant _Chapter15CustomPainter oldDelegate) => image != oldDelegate.image;

}
