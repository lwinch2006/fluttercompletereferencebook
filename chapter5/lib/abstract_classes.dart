abstract class ClassA {
  void processValue();
  int get value;

  void printHelloWorld() {
    print('Hello World');
  }
}

class ClassB extends ClassA {
  @override
  void processValue() => value * 2;

  @override
  int get value => 10;
}