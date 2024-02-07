part of '../bin/chapter4bin.dart';
class Annotation4 {
  final int number;
  final String str;
  const Annotation4(this.number, this.str);

  @override
  String toString() => '$number | $str';
}

@Annotation4(10, "Hello World annotation")
class Example {
  const Example();

  int add(final int first, final int second) {
    return first + second;
  }
}