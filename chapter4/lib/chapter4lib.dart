part of '../bin/chapter4bin.dart';

class Person {
  String? firstName;
  String? lastName;
  Address? address;

  Person([this.firstName, this.lastName]);

  @override
  String toString() => '$firstName $lastName ($address)';

  String toUpperCase() => toString().toUpperCase();

  void printFullName() => print(toString());
  void printFullNameInUpperCase() => print(toUpperCase());
}

class Address {
  String? country;
  String? city;

  Address([this.country, this.city]);

  @override
  String toString() => '$city, $country';
}

Person? getNewPerson() {
  return _getNewPerson3();
}

Person? getNewPerson2() {
  return Person('John', 'Doe');
}

Person? _getNewPerson3() { // Private method
  return Person('John', 'Doe');
}
