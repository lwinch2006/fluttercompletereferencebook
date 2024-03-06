import 'dart:async';

String processInput(String? source) {
  source ??= '';
  return 'Modified ${source.toUpperCase().replaceAll(' ', '')}';
}

Future<String> processInputAsync(String? source) {
  source ??= '';
  return Future<String>.delayed(const Duration(seconds: 2), () => 'Modified ${source!.toUpperCase().replaceAll(' ', '')}');
}

Future<String> futureWithoutAsync() => Future(() => '>>> future without async');
Future<String> futureWithAsync() async => '>>> future with async';
Future<String> futureMicrotask() => Future.microtask(() => '>>> future microtask');
Future<String> futureWithValue() => Future<String>.value('>>> future with value');
Future<String> futureWithSync() => Future<String>.sync(() => '>>> future with sync constructor');
Future<String> futureWithDelay() => Future<String>.delayed(Duration(milliseconds: 100), () => '>>> future with delay');

Future<String> one() async => '1';
Future<String> two() async => '2';
Future<String> three() async => '3';

Future<String> future1() async {
  await Future.wait<void>([future2(), future3(), future4()]);
  return 'All wait futures completed';
}

Future<void> future2() async {
  await Future.delayed(Duration(milliseconds: 100), () {});
}

Future<void> future3() async {
  await Future.delayed(Duration(milliseconds: 200), () {});
}

Future<void> future4() async {
  await Future.delayed(Duration(milliseconds: 300), () {});
}

void doCalculation(int value, {void Function(int)? onSuccess, void Function()? onError}) {
  value *= 2;

  if (value == 0) {
    if (onError != null) {
      onError();
    }

    return;
  }

  if (onSuccess != null) {
    onSuccess(value);
  }
}

Future<String> future5() async {
  final completer = Completer<String>();

  doCalculation(111,
    onSuccess: (value) => completer.complete('Value: $value'),
    onError: () => completer.completeError(Exception('Value is zero'))
  );

  return completer.future;
}


