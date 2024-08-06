import 'dart:convert';
import 'package:chapter7/final1.dart' as final1;
import 'package:chapter7/patterns.dart' as patterns;
import 'package:chapter7/exhaustiveness_checking.dart' as exhaustivenessChecking;

void main(List<String> arguments) {
  print('Advanced language features');

  final jsonAsMap = jsonDecode('{"firstName": "John", "lastName": "Doe"}');
  final user = final1.UserMapper.fromJson(jsonAsMap);
  print('User: ${user.firstName} ${user.lastName}');

  print('');
  patterns.patterns1();

  print('');
  patterns.patterns2();

  print('');
  patterns.patterns3();

  print('');
  patterns.patterns4();

  print('');
  patterns.patterns5();

  print('');
  patterns.patterns6();

  print('');
  exhaustivenessChecking.func1();
}
