
import 'package:chapter6/generics.dart' as generics;
import 'package:chapter6/collections.dart' as collections;

void main(List<String> arguments) {
  print('Generics and collections');

  final intCache1 = generics.DataCache<int>(1, DateTime.now());
  final intCache2 = generics.DataCache(2, DateTime.now());
  final stringCache = generics.DataCache<String>('1+2=', DateTime.now());
  print('${stringCache.data}${intCache1.data + intCache2.data}');

  print('');
  final intCache3 = generics.IntegerCache(111, DateTime.now());
  print('IntegerCache stored value ${intCache3.data}');

  print('');
  collections.collections1();

  print('');
  collections.collections2();

  print('');
  collections.collections3();

  print('');
  collections.collections4();

  print('');
  collections.collections5();
}
