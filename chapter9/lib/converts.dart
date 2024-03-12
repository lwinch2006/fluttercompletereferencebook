import 'dart:convert';

void func1() {
  print('func1()');
  const decoder = Utf8Decoder();
  print(decoder.convert([72, 101, 108, 108, 111]));
  const encoder = Utf8Encoder();
  print(encoder.convert('Hello'));
}

void func2() {
  const encoder = Utf8Encoder();

  final stream = Stream<String>.periodic(Duration(seconds: 1), (int tick) {
    return '$tick';
  }).take(5);

  encoder.bind(stream).listen((event) {
    print(event[0]);
  });
}

class PersonDto {
  String? firstName;
  String? lastName;
  List<String> children;

  PersonDto(this.firstName, this.lastName, this.children);

  factory PersonDto.fromJson(Map<String, Object?> source) {
    final childrenTemp = source['children'] as List<Object?>? ?? <Object?>[];
    final children = childrenTemp
        .where((element) => element != null)
        .map<String>((e) => e as String)
        .toList(growable: false);

    final firstName = source['firstName'] as String?;
    final lastName = source['lastName'] as String?;

    final person = PersonDto(firstName, lastName, children);
    return person;
  }

  Map<String, Object?> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'children': children
    };
  }
}

void func3(String jsonString) {
  final jsonAsMap = json.decode(jsonString) as Map<String, Object?>;
  var person = PersonDto.fromJson(jsonAsMap);

  print('fromJson()');
  print('${person.firstName} ${person.lastName} with children ${person.children}');

  print('toJson');
  print(json.encode(person.toJson()));
}

