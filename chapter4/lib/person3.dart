part of '../bin/chapter4bin.dart';

class Person3 {
  String firstName;
  String lastName;

  // This constructor won't work since first name and last name is not nullable
  // Person3(String firstName, String lastName) {
  //   this.firstName = firstName;
  //   this.lastName = lastName;
  // }

  Person3(String firstName, String lastName) :
    firstName = firstName,
    lastName = lastName;

  @override
  String toString() => '$firstName $lastName';

  String toUpperCase() => toString().toUpperCase();

  void printFullName() => print(toString());
  void printFullNameInUpperCase() => print(toUpperCase());
}
