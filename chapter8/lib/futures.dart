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
