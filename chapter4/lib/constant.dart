part of '../bin/chapter4bin.dart';

class Constant {
  final String name;
  final double value;

  // Unnamed constructor
  const Constant({required this.name, required this.value});

  // Named constructor
  const Constant.euler() : name = 'euler', value = e;
  const Constant.pi() : name = 'pi', value = pi;

  // Redirecting constructor
  const Constant.meaningOfLife() : this(name: 'meaning of life', value: 42);
}