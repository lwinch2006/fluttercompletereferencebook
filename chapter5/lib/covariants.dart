abstract class ClassA {
  const ClassA();
  void use(final ClassA classA);
}

class ClassB extends ClassA {
  const ClassB();

  @override
  void use(final ClassA classA) {}
}

class ClassC extends ClassA {
  const ClassC();

  @override
  void use(covariant final ClassB classB) {}
}