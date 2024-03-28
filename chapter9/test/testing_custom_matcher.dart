import 'package:test/test.dart';

class EqualsWithPrecision extends Matcher {
  final double value;
  final double precision;

  const EqualsWithPrecision(this.value, {this.precision = 1.0e-12})
      : assert(precision >= 0, 'precision must be >= 0');

  @override
  bool matches(dynamic item, Map matchStates) {
    if (item is double) {
      return (item - value).abs() <= precision;
    }

    return item == value;
  }

  @override
  Description describe(Description description) {
    return description.add('$value (+/- $precision)');
  }

  @override
  Description describeMismatch(dynamic item, Description mismatchDescription,
      Map matchState, bool verbose) {
    return super.describeMismatch(item, mismatchDescription, matchState, verbose)
      ..add('$item is not in range of $value (+/- $precision)');
  }
}

void testingCustomMatcher() {
  group('Testing EqualsWithPrecision matcher', () {
    test('Testing two values within precision', () {
      expect(0.002, EqualsWithPrecision(0.003, precision: 0.001));
    });

    // test('Testing two values outside precision', () {
    //   expect(0.005, EqualsWithPrecision(0.003, precision: 0.001));
    // });
  });
}
