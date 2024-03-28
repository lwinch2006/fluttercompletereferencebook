class Calculator {

  const Calculator();

  double sum(double num1, double num2) {
    return num1 + num2;
  }

  double subtract(double num1, double num2) {
    return num1 - num2;
  }

  double multiply(double num1, double num2) {
    return num1 * num2;
  }

  double divide(double num1, double num2) {
    if (num2 == 0) {
      throw CustomDivideByZeroException("Attempt for division by zero");
    }

    return num1 / num2;
  }
}

class CustomDivideByZeroException implements Exception {
  final String message;
  const CustomDivideByZeroException(this.message);

  @override
  String toString() => 'DivisionByZeroException: $message';
}

