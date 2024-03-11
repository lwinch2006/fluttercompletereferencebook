import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

Map<String, Object?> processJson(String jsonAsString) {
  return jsonDecode(jsonAsString);
}

Future<void> isolatesFunc1() async {
  const jsonAsString = '{"property": "value"}';

  final jsonData = await Isolate.run<Map<String, Object?>>(() {
    return jsonDecode(jsonAsString) as Map<String, Object?>;
  });

  print('Json has ${jsonData.length} entries');
}

Future<void> isolatesFunc2_1() async {
  final receivePort = ReceivePort();
  final isolate = await Isolate.spawn<SendPort>(_isolatesFunc2_2, receivePort.sendPort);

  var receiveCount = 0;
  receivePort.listen((message) {
    if (message is SendPort) {
      final sendPort = message;
      sendPort.send('Hello');
      sendPort.send('World');
      return;
    }

    receiveCount++;
    if (receiveCount == 2) {
      print('2.1 - All messages are received by isolate');
      receivePort.close();
      isolate.kill();
    }
  });
}

Future<void> isolatesFunc2_3() async {
  final receivePort = ReceivePort();
  final isolate = await Isolate.spawn<SendPort>(_isolatesFunc2_2, receivePort.sendPort);
  final broadcast = receivePort.asBroadcastStream();
  final sendPort = await broadcast.first as SendPort;

  sendPort.send('Hello');
  sendPort.send('World');

  var receiveCount = 0;
  broadcast.listen((message) {
    receiveCount++;
    if (receiveCount == 2) {
      print('2.3 - All messages are received by isolate');
      receivePort.close();
      isolate.kill();
    }
  });
}

void _isolatesFunc2_2(SendPort sendPort) {
  final receivePort = ReceivePort();
  sendPort.send(receivePort.sendPort);

  receivePort.listen((message) {
    if (message is! String) {
      return;
    }

    switch (message) {
      case 'Hello':
        print('Received Hello');
        sendPort.send('Received Hello');
      case 'World':
        print('Received World');
        sendPort.send('Received World');
      default:
        print('Received Unknown');
    }
  });
}

void isolatesFunc3() {
  print('isolatesFunc3() - start');
  runZoned(() {
    print('runZoned()');
  });

  print('isolatesFunc3() - end');
}

void isolatesFunc4() {
  print('isolatesFunc4() - start');

  runZonedGuarded(() {
    print('runZonedGuarded()');

    Future.delayed(Duration(seconds: 1), () {
      print('Future.delayed()');
    });

    throw Exception('Exception happened');

  }, (error, stack) {
    print(error);
  });

  print('isolatesFunc4() - end');
}





