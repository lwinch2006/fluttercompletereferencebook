
import 'package:chapter9/converts.dart';
import 'package:chapter9/io_functions.dart';

void main(List<String> arguments) {
  print('API overview and tests');

  print('');
  func1();

  print('');
  final stopWatch = Stopwatch();
  stopWatch.start();
  func2();
  stopWatch.stop();
  print('Stopwatch elapsed (ms): ${stopWatch.elapsed.inMilliseconds}');

  print('');
  const jsonString = '''
  {
    "firstName": "John",
    "lastName": "Doe",
    "children": ["Mary", "Patrik"]
  }''';
  func3(jsonString);

  print('');
  //ioFunc1();

  print('');
  //ioFunc2();

  print('');
  //ioFunc3();

  print('');
  //ioFunc4();
}
