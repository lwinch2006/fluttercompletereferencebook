class CustomDivideByZeroException implements Exception {
  final String message;
  const CustomDivideByZeroException(this.message);

  @override
  String toString() => 'DivisionByZeroException: $message';
}

double divide1(double num1, double num2) {
  if (num2 == 0) {
    throw Exception("Attempt for division by zero");
  }

  return num1 / num2;
}

double divide2(double num1, double num2) {
  if (num2 == 0) {
    throw CustomDivideByZeroException("Attempt for division by zero");
  }

  return num1 / num2;
}




