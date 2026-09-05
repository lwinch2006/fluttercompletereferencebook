part of chapter4;

class Person9 {
  final int age;
  const Person9(this.age);
}

Person9 init(int age, Person9 Function(int) func) {
  return func(age);
}
