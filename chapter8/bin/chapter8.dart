import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:chapter8/futures.dart';
import 'package:chapter8/isolates.dart';
import 'package:chapter8/streams.dart';

void main(List<String> arguments) {
  print('Futures, Streams and Isolates');

  //workWithFutures();

  //workWithStreams().then((value) => print('workWithStreams() is completed'));

  workWithIsolates().then((value) => print('workWithIsolates() is completed'));
}

void workWithFutures() {
  print('Events (Sync)');
  print('Enter string:');
  final input1 = stdin.readLineSync();
  print(processInput(input1));
  print('End (Sync)');

  print('');
  print('Events (Async)');
  print('Enter string:');
  final input2 = stdin.readLineSync();
  processInputAsync(input2).then(print);
  print('End (Async)');

  print('');
  print('Future without async');
  futureWithoutAsync().then(print);

  print('');
  print('Future with async');
  futureWithAsync().then(print);

  print('');
  print('Future with microtask');
  futureMicrotask().then(print);

  print('');
  print('Future with value');
  futureWithValue().then(print);

  print('');
  print('Future with sync constructor');
  futureWithSync().then(print);

  print('');
  print('Future with delay');
  futureWithDelay().then(print);

  print('');
  print('Chaining one() two() three()');
  one().then((value) {
    print(value);
    return two();
  })
      .then((value) {
    print(value);
    return three();
  })
      .then((value) {
    print(value);
  })
      .catchError((e) {
    print('Error: $e');
  })
      .whenComplete(() {
    print('finally');
  });

  print('');
  future1().then(print);

  print('');
  future5().then(print);
}

Future<void> workWithStreams() async {
  print('Working with streams');

  final stream1 = intNumbersStream(numCount: 3);
  stream1.listen((event) {
    print('Received number from stream (method 1): $event');
  });

  final stream2 = intNumbersStream(numCount: 3);
  await for(var event in stream2) {
    print('Received number from stream (method 2): $event');
  }

  final stream3 = intNumbersStream2(numCount: 3);
  stream3.listen((event) {
    print('Received number from controller stream: $event');
  });

  final rnd = Random();
  final stream4 = Stream<int>.periodic(Duration(seconds: 1), (_) => rnd.nextInt(100)).take(5);

  var countDown1 = 3;
  final stream5 = stream4.where((event) => countDown1 > 0 && event.isEven);
  stream5.listen((event) {
    print('Received number from stream5: $event');
    countDown1--;
  });

  var countDown2 = 3;
  final stream6 = Stream<int>.periodic(Duration(seconds: 1), (_) => rnd.nextInt(100)).take(5);
  final stream7 = stream6
      .where((event) => countDown2 > 0 && event.isEven)
      .map((event) => '$event');

  stream7.listen((event) {
    print('Received number from stream6: $event');
    countDown2--;
  });

  final stream8 = Stream<String>.fromIterable(['Hello\nWorld', '\rboys!']);
  stream8.transform(const LineSplitter()).listen(print);

  final stream9 = intNumbersStream3(numCount: 3);
  for (var event in stream9) {
    print('Received number from stream9: $event');
  }
}

Future<void> workWithIsolates() async {
  print('');
  print('Working with isolates');

  await isolatesFunc1();
  await isolatesFunc2_1();
  await isolatesFunc2_3();

  isolatesFunc3();
  isolatesFunc4();





}






