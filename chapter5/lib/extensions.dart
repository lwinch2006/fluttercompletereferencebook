class ClassA {
  String? _someField;
  final int number;

  ClassA(this.number);

  factory ClassA.fromString(String numberAsString) {
    var num = int.tryParse(numberAsString);

    if (num != null) {
      return ClassA(num);
    }

    throw Exception('$numberAsString is not a number');
  }

  String? get someField => _someField;
  set someField(String? value) {
    _someField = value;
  }
}

extension ClassAExtension on String {
  ClassA toClassA() => ClassA.fromString(this);
}

