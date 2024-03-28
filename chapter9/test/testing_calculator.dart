import 'package:chapter9/testing.dart';
import 'package:test/test.dart';

void testingCalculator() {
  const calc = Calculator();

  group('Testing calculator functions', () {
    test('Testing addition', () {
      expect(calc.sum(2, 3), equals(5));
    });

    test('Testing subtraction', () {
      expect(calc.subtract(2, 3), equals(-1));
    });

    test('Testing multiplication', () {
      expect(calc.multiply(2, 3), equals(6));
    });

    test('Testing division', () {
      expect(calc.divide(10, 4), equals(2.5));
    });

    test('Testing division with exception', () {
      expect(() => calc.divide(10, 0), throwsA(isA<CustomDivideByZeroException>()));
    });
  });
}
