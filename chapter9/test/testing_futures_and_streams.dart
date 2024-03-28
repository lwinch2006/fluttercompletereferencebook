import 'package:test/test.dart';

Future<int> compute(int value) {
  return Future.delayed(const Duration(milliseconds: 200), () => value * 2);
}

Stream<int> intGenerator() async* {
  for (var i = 0; i < 5; i++) {
    await Future.delayed(const Duration(milliseconds: 100));
    yield i;
  }
}

class TestClass {
  final int valueAsInt;
  final String valueAsString;
  const TestClass(this.valueAsInt, this.valueAsString);
}

Stream<TestClass> testClassGenerator() async* {
  for (var i = 0; i < 5; i++) {
    await Future.delayed(const Duration(milliseconds: 100));
    yield TestClass(i, 'Value: $i');
  }
}

double meanValue(int a, int b) => (a + b) * 0.5;

void testingFuturesAndStreams() {
  group('Testing Futures and Streams', () {
    test('Testing Future<> with async', () async {
      expect(await compute(5), equals(10));
    });

    test('Testing Future<> without async', () {
      expect(compute(5), completion(equals(10)));
    });

    test('Testing Stream<int>', () {
      final intStream = intGenerator();
      expect(intStream, emitsInOrder(const [0, 1, 2, 3, 4]));
    });

    test('Testing Stream<TestClass>', () {
      final testClassStream = testClassGenerator();

      var counter = 0;
      testClassStream.listen(expectAsync1<void, TestClass>((actual) {
          expect(actual.valueAsInt, equals(counter));
          expect(actual.valueAsString, equals('Value: $counter'));
          counter++;
        }, count: 5)
      );
    });
    
    test('expectAsync that runs 2 times', () async {
      final func = expectAsync2<double, int, int>((p0, p1) => meanValue(p0, p1), count: 2);
      
      await Future.delayed(Duration(milliseconds: 100), () {
        expect(func(2,4), equals(3));
      });

      await Future.delayed(Duration(milliseconds: 100), () {
        expect(func(2,8), equals(5));
      });
    });
  });
}



