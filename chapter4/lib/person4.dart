part of '../bin/chapter4bin.dart';

class Person4 {
  late String firstName;
  late String lastName;

  Person4(String firstName, String lastName) {
    this.firstName = firstName;
    this.lastName = lastName;
  }


  @override
  String toString() => '$firstName $lastName';

  String toUpperCase() => toString().toUpperCase();

  void printFullName() => print(toString());
  void printFullNameInUpperCase() => print(toUpperCase());
}