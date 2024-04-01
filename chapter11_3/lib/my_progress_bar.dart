import 'package:chapter11_3/my_progress_bar_painter.dart';
import 'package:flutter/cupertino.dart';

class MyProgressBar extends StatelessWidget {
  final int progressValue;
  const MyProgressBar({super.key, required this.progressValue});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyProgressBarPainter(progressValue: progressValue),
      child: SizedBox(
        width: 100,
        height: 100,
        child: Center(
          child: Text('$progressValue%',
          style: const TextStyle(fontSize: 20),),
        ),
      ),
    );
  }
}