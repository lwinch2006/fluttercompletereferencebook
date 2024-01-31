part of '../bin/chapter4bin.dart';

class Person2 {
  String? _firstName;
  String? _lastName;

  // Default (unnamed) constructor
  Person2([this._firstName, this._lastName]);

  // Named constructors
  Person2.constructor2(this._firstName, this._lastName);
  Person2.constructor3(String? firstName, String? lastName) :
        _firstName = firstName,
        _lastName = lastName;

  // Private constructors
  Person2._();
  Person2._constructor4(this._firstName, this._lastName);

  @override
  String toString() => '$_firstName $_lastName';

  String toUpperCase() => toString().toUpperCase();

  void printFullName() => print(toString());
  void printFullNameInUpperCase() => print(toUpperCase());
}