import 'package:chapter2/chapter2.dart' as chapter2;

late int globalVariable;

void main(List<String> arguments) {
  print('Hello world: ${chapter2.calculate()}!');

  chapter2.variables();

  chapter2.nullSafety();
  globalVariable = 111;
  print(globalVariable);

  chapter2.numbers();

  chapter2.strings();

  chapter2.enums();

  chapter2.lists();

  chapter2.environmentVariables();

  chapter2.operators();
}
