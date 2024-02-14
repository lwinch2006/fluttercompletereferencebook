class ClassA implements Comparable<ClassA> {
  final int number;
  ClassA(this.number);

  @override
  String toString() => 'ClassA(number: $number)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other is ClassA) {
      return number == other.number && runtimeType == other.runtimeType;
    }

    return false;
  }

  @override
  int get hashCode => number.hashCode;

  @override
  int compareTo(ClassA other) {
    if (identical(this, other) || number == other.number) {
      return 0;
    }

    return number > other.number
        ? 1
        : -1;
  }
}


