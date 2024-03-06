import 'dart:async';
import 'dart:io';
import 'dart:math';

Stream<int> zerosStream() async* {
  yield 0;
  yield 0;
}

Stream<int> intNumbersStream({required int numCount}) async* {
  final rnd = Random();

  var currNumCount = 0;
  while (currNumCount < numCount) {
    await Future<void>.delayed(Duration(milliseconds: 300));
    var num = rnd.nextInt(100) + 1;

    if (num < 50) {
      yield* zerosStream();
    }

    yield num;
    currNumCount++;
  }
}

Stream<int> intNumbersStream2({required int numCount}) {
  late StreamController<int> controller;
  final rnd = Random();

  void startController() async {
    var currNumCount = 0;
    while (currNumCount < numCount) {
      await Future<void>.delayed(Duration(milliseconds: 300));
      var num = rnd.nextInt(100) + 1;
      controller.add(num);
      currNumCount++;
    }
    controller.close();
  }

  void startController2() {
    var currNumCount = 0;
    while (currNumCount < numCount) {
      Future<void>.delayed(Duration(milliseconds: 300), () {
        var num = rnd.nextInt(100) + 1;
        controller.add(num);
        currNumCount--;

      }).then((value) {
        if (currNumCount == 0) {
          print('Closing stream controller');
          controller.close();
        }
      });
      currNumCount++;
    }
  }

  controller = StreamController<int>(
      onListen: startController
  );

  return controller.stream;
}

Iterable<int> intNumbersStream3({required int numCount}) sync* {
  final rnd = Random();
  var currNumCount = 0;
  while (currNumCount < numCount) {
    sleep(Duration(milliseconds: 300));
    var num = rnd.nextInt(100) + 1;
    yield num;
    currNumCount++;
  }
}