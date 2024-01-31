part of '../bin/chapter4bin.dart';

class Person5 {
  String firstName;
  String lastName;

  // Named parameter can not be private (with underscore)
  Person5({required this.firstName, this.lastName = ''});


  @override
  String toString() => '$firstName $lastName';

  String toUpperCase() => toString().toUpperCase();

  void printFullName() => print(toString());
  void printFullNameInUpperCase() => print(toUpperCase());
}