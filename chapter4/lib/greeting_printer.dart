part of '../bin/chapter4bin.dart';

class _GreetingPrinter {
  const _GreetingPrinter();

  void call(String name) {
    print('Greetings, $name');
  }
}

const printGreeting = _GreetingPrinter();