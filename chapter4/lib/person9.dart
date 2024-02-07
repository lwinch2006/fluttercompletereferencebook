part of '../bin/chapter4bin.dart';

class Person9 {
  final int age;
  const Person9(this.age);
}

Person9 init(int age, Person9 Function(int) func) {
  return func(age);
}
