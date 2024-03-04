void patterns1() {
  print('Patterns');
  final (a, b, c) = ("abc", 123, [1, 2, 3]);
  print('a (runtime type): ${a.runtimeType}');
  print('b (runtime type): ${b.runtimeType}');
  print('c (runtime type): ${c.runtimeType}');

  print('');
  final [item1, item2, item3] = <int>[1, 2, 3];
  print('item1: $item1');
  print('item2: $item2');
  print('item3: $item3');

  print('');
  final {'key1': value1, 'key2': value2} = <String, int>{'key1': 1, 'key2': 2};
  print('value1: $value1');
  print('value2: $value2');
}

void patterns2() {
  print('Switch statements');
  final record = (1, 2);

  switch (record) {
    case (1, 2):
      print('Match');
    default:
      print('Not match');
  }

  switch (record) {
    case (int a, int b) when a == 1 && b == 2:
      print('Match');
    default:
      print('Not match');
  }
}

void patterns3() {
  print('Switch expressions');

  final record = (1, 2);

  // First and second expressions are same
  var result = switch (record) {
    (1, 2) => 'Match',
    (int a, int b) when a == 1 && b == 2 => 'Match',
    _ => 'Not match'
  };

  print(result);
}

void patterns4() {
  print('if-case expressions');

  const json = {
    'skills': ['Dart', 'Flutter', '.NET']
  };

  if (json case {'skills': [String first, String second, ...]}) {
    print('');
    print('First skill: $first');
    print('Second skill: $second');
  }

  if (json case {'skills': [String first, String second, String? third, ...]} when third.isNotEmpty) {
    print('');
    print('First skill: $first');
    print('Second skill: $second');
    print('Third skill: $third');
  }
}

void patterns5() {
  print('NULL pattern');

  String? str;

  switch (str) {
    case var a?: // excluding nullability
      print('$a is String');
    case var b: // including nullability
      print('$b is String?');
  }

  final record = (a: 1, 'test');
  final (a: int a, String b) = record;

  final record2 = (a2: 2, 'test2');
  final (:a2, b2) = record2;

  final record3 = (a3: 3, 'test3');
  final (: int a3, String b3) = record3;

  print('Record pattern');
  print('a: $a');
  print('b: $b');
  print('a2: $a2');
  print('b2: $b2');
  print('a3: $a3');
  print('b3: $b3');
}

class Point {
  final int x;
  final int y;
  const Point(this.x, this.y);
}

void patterns6() {
  print('Object pattern');
  var points = [Point(0,0), Point(10,10), Point(4,3)];

  for (var point in points) {
    switch (point) {
      case Point(x: 0, y: 0):
        print('Origin point at (0,0)');
      case Point(x: final x, y: final y) when x == y:
        print('Diagonal point at ($x,$y)');
      default :
        print('Point at (${point.x},${point.y})');
    }
  }
}
