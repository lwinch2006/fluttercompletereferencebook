// import 'package:chapter4/chapter4lib.dart' as chapter4; // Imports all public things from library
// import 'package:chapter4/chapter4lib.dart' as chapter4 show Person, Address, getNewPerson; // Imports some public things from library
//import 'package:chapter4/chapter4lib.dart' as chapter4 hide getNewPerson2; // Imports all except hidden public things from library, "as" declares alias for library

import 'dart:math';
import 'dart:mirrors';





part '../lib/chapter4lib.dart';
part '../lib/person2.dart';
part '../lib/person3.dart';
part '../lib/person4.dart';
part '../lib/person5.dart';
part '../lib/singleton.dart';
part '../lib/person6.dart';
part '../lib/constant.dart';
part '../lib/person7.dart';
part '../lib/hello_world.dart';
part '../lib/greeting_printer.dart';
part '../lib/person8.dart';
part '../lib/people.dart';
part '../lib/people2.dart';
part '../lib/annotation1.dart';
part '../lib/annotation2.dart';
part '../lib/annotation3.dart';
part '../lib/annotation4.dart';
part '../lib/person9.dart';

@Annotation1()
@Annotation2(111)
@dkaEnabled
void main(List<String> arguments) {

  var person = Person('John', 'Doe');
  print('Person: $person');
  print('Person: ${person.toUpperCase()}');

  // Cascade notation
  person
  ..printFullName()
  ..printFullNameInUpperCase();


  Person? person2 = getNewPerson();

  // Cascade notation with Null check
  person2
    ?..printFullName()
    ..printFullNameInUpperCase();

  var person3 = Person()
  ..firstName = 'John'
  ..lastName = 'Doe'
  ..address = (Address()
      ..country = 'Norway'
      ..city = 'Oslo'
  );

  print('Person: $person3');

  var person4 = Person2();
  var person5 = Person2.constructor2('John', 'Doe');
  var person6 = Person2.constructor3('John', 'Doe');

  print('Person 4: $person4');
  print('Person 5: $person5');
  print('Person 6: $person6');

  var person7 = Person3('John', 'Doe');
  print('Person 7: $person7');

  var person8 = Person4('John', 'Doe');
  print('Person 8: $person8');

  var person9 = Person5(firstName: 'John', lastName: 'Doe');
  print('Person 9: $person9');

  var singleton1 = Singleton();
  print('Singleton 1 runtime type: ${singleton1.runtimeType}');

  singleton1 = Singleton();
  print('Singleton 1 runtime type: ${singleton1.runtimeType}');

  var singleton2 = Singleton();
  print('Singleton 2 runtime type: ${singleton2.runtimeType}');

  var person10 = Person6('John', 'Doe');
  print('Person 10: $person10');

  person10 = Person6('John2', 'Doe2');
  print('Person 10: $person10');

  const person11 = Person6('John', 'Doe');
  print('Person 11: $person11');

  final person12 = Person6('John', 'Doe');
  print('Person 12: $person12');

  final const1 = Constant.euler();
  final const2 = Constant.euler();
  print('const1 == const2: ${const1 == const2}');

  const const3 = Constant.euler();
  const const4 = Constant.euler();
  print('const3 == const4: ${const3 == const4}');

  const const5 = Constant.meaningOfLife();
  const const6 = Constant.meaningOfLife();
  print('const5 == const6: ${const5 == const6}');

  final person13 = Person7('John', 'Doe');
  print('Person 13: $person13');

  person13.firstName = '';
  person13.lastName = '';
  print('Person 13: $person13');

  final person14 = Person7('Peter', 'Jackson');
  final person15 = Person7('Mary', 'Jackson');
  final kid = person14 + person15;
  print('Person 14: $person14');
  print('Person 15: $person15');
  print('Kid: $kid');

  print('');

  final helloWorld = HelloWorld();
  helloWorld.call();
  helloWorld();

  print('');

  printGreeting('John');
  printGreeting('Mary');

  print('');

  final person16 = Person8(Name('John'), 20);
  final person17 = Person8(person16.name, person16.age);
  print('Person 16 (before change): $person16');
  print('Person 17 (before change): $person17');

  person16.name.value  = 'Jake';
  person16.age = 30;
  print('Person 16 (after change): $person16');
  print('Person 17 (after change): $person17');

  print('');

  final person18 = Person8(Name('John'), 20);
  final person19 = person18.copyWith();
  print('Person 18 (before change): $person18');
  print('Person 19 (before change): $person19');

  person18.name.value  = 'Jake';
  person18.age = 30;
  print('Person 18 (after change): $person18');
  print('Person 19 (after change): $person19');

  print('');

  final person20 = Person8(Name('John'), 20);
  final person21 = person20.copyWith(age: 33);
  print('Person 20 (before change): $person20');
  print('Person 21 (before change): $person21');

  person20.name.value  = 'Jake';
  person20.age = 50;
  print('Person 20 (after change): $person20');
  print('Person 21 (after change): $person21');

  print('');

  final people = People(<Person8>[]);
  people.people.add(Person8(Name('John'), 20));
  people.people.add(Person8(Name('Jake'), 30));

  final newPeople = people.copyWith();

  print('People (before change):\n$people');
  print('New People (before change):\n$newPeople');

  people.people[0].name.value = 'Martin';
  people.people[0].age = 50;

  print('People (after change):\n$people');
  print('New People (after change):\n$newPeople');

  print('');

  final people2 = People2(<Person8>[]);
  people2.people.add(Person8(Name('John'), 20));
  people2.people.add(Person8(Name('Jake'), 30));

  final newPeople2 = people2.copyWith();

  print('People 2 (before change):\n$people2');
  print('New People 2 (before change):\n$newPeople2');

  people2.people[0].name.value = 'Martin';
  people2.people[0].age = 50;

  print('People 2 (after change):\n$people2');
  print('New People 2 (after change):\n$newPeople2');

  print('');
  final exampleType = reflectClass(Example);
  print('Abstract: ${exampleType.isAbstract}');
  print('Enum: ${exampleType.isEnum}');
  print('Top level: ${exampleType.isTopLevel}');

  for (final annotation in exampleType.metadata) {
    print('${annotation.type.originalDeclaration.reflectedType} with value: ${annotation.reflectee}');
  }

  for (final declaration in exampleType.declarations.entries) {
    print('Declaration: ${declaration.key} ${declaration.value}');
  }

  for (final instanceMember in exampleType.instanceMembers.entries) {
    print('Member name: ${instanceMember.key}');
  }

  if (exampleType.superclass != null) {
    print('Super class of Example: ${exampleType.superclass!.reflectedType}');
  }

  print('');
  final person22 = init(10, (p0) => Person9(p0));
  final person23 = init(11, Person9.new);
  print('Person 22 age: ${person22.age}');
  print('Person 23 age: ${person23.age}');

}
