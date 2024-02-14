abstract class Interface1 {
  int get value;
  void method1();
}

abstract class Interface2 {
  void method2();
}

class ClassA implements Interface1, Interface2 {
  @override
  int get value => 10;

  @override
  void method1() {
    print('Value * 2 = ${value * 2}');
  }

  @override
  void method2() {
    print('Value / 2 = ${value ~/ 2}');
  }
}