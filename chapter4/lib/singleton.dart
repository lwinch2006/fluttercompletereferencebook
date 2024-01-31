part of '../bin/chapter4bin.dart';

class Singleton {
  static final _instance = Singleton._();

  Singleton._();
  factory Singleton() => _instance;
}