import 'package:flutter/cupertino.dart';

class MyStreamBuilderWidget extends StatefulWidget {
  const MyStreamBuilderWidget({super.key});

  @override
  State<StatefulWidget> createState() => _MyStreamBuilderWidgetState();
}

class _MyStreamBuilderWidgetState extends State<StatefulWidget> {
  final streamInState = Stream<int>.periodic(
          const Duration(seconds: 1), (computationCount) => computationCount)
      .take(5);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: streamInState,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return Text('Data: ${snapshot.data}');
          }

          if (snapshot.hasError) {
            return const Text('Operation failed');
          }

          return const Text('Operation completed with no data');
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return const Text('Stream closed');
        }

        return const Text('Wait...');
      },
    );
  }
}
