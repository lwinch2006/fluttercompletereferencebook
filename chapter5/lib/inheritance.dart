class ClassA {
  final int value;

  const ClassA(this.value);

  double method1(final double param) => param * 0.5;
  double method2(final double param) => param * 0.5;
}

class ClassB extends ClassA {

  ClassB(final int value) :
        assert(value >= 0, 'value must be positive'),
        super(value);

  const ClassB.constant(super.value);

  @override
  double method1(final double param) => param * 0.75;

  @override
  double method2(double param) {
    param = super.method2(param);
    param /= 0.5;
    return param;
  }
}

class ClassC extends ClassB {
  ClassC(super.value);
}