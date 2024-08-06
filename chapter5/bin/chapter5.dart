import 'package:chapter5/inheritance.dart' as inheritance;
import 'package:chapter5/abstract_classes.dart' as abstract_classes;
import 'package:chapter5/interfaces.dart' as interfaces;
import 'package:chapter5/mixins.dart' as mixins;
import 'package:chapter5/extensions.dart' as extensions;
import 'package:chapter5/covariants.dart' as covariants;
import 'package:chapter5/factories.dart' as factories;
import 'package:chapter5/casts.dart' as casts;
import 'package:chapter5/object_class.dart' as object_class;
import 'package:chapter5/records.dart' as records;
import 'package:chapter5/exceptions_and_errors.dart' as exceptions;

void main(List<String> arguments) {
  final a1 = inheritance.ClassA(10);
  // inheritance.ClassB b1 = a1; // Compile time error

  final b2 = inheritance.ClassB(11);
  final a2 = b2;

  const a3 = inheritance.ClassA(12);
  final b3 = /*const*/ inheritance.ClassB(
      13); // const wouldn't work here because class B does not define const constructor

  const b4 = inheritance.ClassB.constant(14);

  print('');
  // final a4 = abstractClasses.ClassA(); // Abstract classes cannot be instantiated
  final b5 = abstract_classes.ClassB();
  print('ClassB value: ${b5.value}');
  b5.processValue();
  b5.printHelloWorld();
  print('ClassB value: ${b5.value}');

  print('');
  final a5 = interfaces.ClassA();
  a5.method1();
  a5.method2();

  print('');
  const a6 = mixins.ClassA('Hello World');
  print('a6.name = ${a6.name}');
  print('a6.name (replaceWhitespaces) = ${a6.replaceWhitespaces(a6.name)}');

  print('');
  final a7 = '111'.toClassA();
  final a8 = extensions.ClassA.fromString('222');
  final a9 = extensions.ClassA(333);
  print(a7.number);
  print(a8.number);
  print(a9.number);

  print('');
  final c1 = covariants.ClassB();
  final c2 = covariants.ClassC();

  c2.use(c1);
  // c2.use(c2); Compiler error since covariant keyword was used in class definition.

  print('');
  final c3 = factories.ClassA.b();
  final c4 = factories.ClassB();
  final c5 = factories.ClassC();

  print(c3.getString());
  print(c4.getString());
  print(c5.getString());

  print('');
  casts.example1();

  print('');
  print('Comparison of object_class.ClassA(111) == object_class.ClassA(111): ${object_class.ClassA(111) == object_class.ClassA(111) }');
  print('Comparison of object_class.ClassA(1).compareTo(object_class.ClassA(2)): ${object_class.ClassA(1).compareTo(object_class.ClassA(2)) }');
  print('Comparison of object_class.ClassA(1).compareTo(object_class.ClassA(1)): ${object_class.ClassA(1).compareTo(object_class.ClassA(1)) }');
  print('Comparison of object_class.ClassA(2).compareTo(object_class.ClassA(1)): ${object_class.ClassA(2).compareTo(object_class.ClassA(1)) }');

  print('');
  records.example1();
  records.example2();

  print('');

  try {
    print(exceptions.divide2(10.0, 3.0));
    print(exceptions.divide2(10.0, 0.0));
  } on exceptions.CustomDivideByZeroException catch (ex) { // Specific exception
    print('Division by zero attempt:\n$ex');
    // rethrow; // re-throwing exception
  } on Exception catch (ex) { // General exception
    print('Exception:\n$ex');
  } catch (ex) { // General object, catches everything
    print('Object:\n$ex');
  } finally {
    print('Finally block executed');
  }

  try {

  } on Error {
    print('Handling error'); // Catches errors. Bad.
  }

  try {

  } catch (_) {
    print('Catching everything'); // Catching everything. Bad.
  }

}
