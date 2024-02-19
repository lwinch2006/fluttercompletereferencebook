class ClassA with StringUtils {
  final String name;
  const ClassA(this.name);

  @override
  void testMethod() {}
}

class ClassB extends ClassA {
  const ClassB(super.name);

  @override
  String get name => '${super.name} overridden';
}

mixin StringUtils {
  String replaceWhitespaces(String source) {
    return source.replaceAll(' ', '_');
  }

  // abstract method but without abstract keyword
  // not advisable to make abstract methods in mixins
  void testMethod();
}






