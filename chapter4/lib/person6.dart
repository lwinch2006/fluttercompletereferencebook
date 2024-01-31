part of '../bin/chapter4bin.dart';

class Person6 {
  final String firstName;
  final String lastName;

  // const constructor can be only defined when all fields are final
  const Person6(this.firstName, this.lastName);

  @override
  String toString() => '$firstName $lastName';

  String toUpperCase() => toString().toUpperCase();

  void printFullName() => print(toString());
  void printFullNameInUpperCase() => print(toUpperCase());
}