abstract class ClassA {
  const ClassA();
  String getString();
  factory ClassA.b() => ClassB();
}

class ClassB extends ClassA {
  const ClassB();

  @override
  String getString() {
    return 'ClassB';
  }
}

class ClassC extends ClassA {
  const ClassC();

  @override
  String getString() {
    return 'ClassA';
  }
}