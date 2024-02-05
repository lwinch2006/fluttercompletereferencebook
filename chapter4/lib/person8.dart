part of '../bin/chapter4bin.dart';

class Person8 {
  Name name;
  int age;
  Person8(this.name, this.age);

  @override
  String toString() => '$name $age';

  Person8 copyWith({Name? name, int? age}) {
    return Person8(
      name ?? Name(this.name.value),
      age ?? this.age
    );
  }
}

class Name {
  String value;
  Name(this.value);

  @override
  String toString() => value;
}