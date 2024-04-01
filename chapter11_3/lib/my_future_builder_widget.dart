import 'dart:math';

import 'package:flutter/cupertino.dart';

class MyFutureBuilderWidget extends StatefulWidget {
  const MyFutureBuilderWidget({super.key});

  @override
  State<MyFutureBuilderWidget> createState() => _MyFutureBuilderWidgetState();
}

class _MyFutureBuilderWidgetState extends State<MyFutureBuilderWidget> {
  final _value = Future<int>.delayed(Duration(seconds: 2), () {
    return Random().nextInt(100);
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: _value,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Text('Data: ${snapshot.data}');
          }

          if (snapshot.hasError) {
            return const Text('Operation failed');
          }

          return const Text('Operation completed with no data');
        }

        return const Text('Wait...');
      },
    );
  }
}
