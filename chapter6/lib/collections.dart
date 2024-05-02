
import 'dart:collection';

void collections1() {
  print('lists');

  // dynamic list/array
  final list1 = [1, 2, 3];
  list1.add(4);
  print('list1: $list1');

  const list2 = <int>[1, 2, 3];
  print('list2: $list2');

  //fixed size list/array
  final list3 = List<int>.filled(3, 1);
  print('list3: $list3');

  final list4 = List<int>.generate(3, (index) => index);
  print('list4: $list4');

  final list5 = List<int>.empty();
  print('list5: $list5');

  final list6 = [1,2,3];
  final list7 = List<int>.unmodifiable(list6);
  final list8 = UnmodifiableListView<int>(list6);
  print('list6 (before change): $list6');
  print('list7 (before change): $list7');
  print('list8 (before change): $list8');

  list6[0] = 111;
  print('list6 (after change): $list6');
  print('list7 (after change): $list7');
  print('list8 (after change): $list8');

  const hasCoffee = false;
  const list9 = [1, 2, if (hasCoffee) 3 else 4];
  print('list9: $list9');

  final list10 = [
    for (var i = 100; i < 105; i++) i,
  ];
  print('list10: $list10');

  const list11 = [1,2,3];
  List<int>? list12;

  const list13 = [...list11, 4, 5];
  final list14 = [...?list12, 4, 5];
  print('list13: $list13');
  print('list14: $list14');

  final list15 = [0, ...?list12, ...list11];
  print('list15: $list15');

  final list16 = [1,2,3];
  list16..add(4)..add(5);
  print('list16: $list16');
}

void collections2() {
  print('sets');
  const set1 = {1,2,3,4,5};
  print('set1: $set1');

  final set2 = <int>{}..add(1)..add(2)..add(3);

  final set3 = <int>{};
  final set4 = Set<int>.identity();

  final set5 = {1,2,3};
  final set6 = Set<int>.unmodifiable(set5);
  final set7 = UnmodifiableSetView(set5);
  print('set5 (before change): $set5');
  print('set6 (before change): $set6');
  print('set7 (before change): $set7');

  set5.add(111);
  print('set5 (after change): $set5');
  print('set6 (after change): $set6');
  print('set7 (after change): $set7');

  final set8 = {1,2,3};
  Set<int>? set9;

  final set10 = {0, ...?set9, ...set8};
  print('set10: $set10');
  print('set10[2]: ${set10.elementAt(2)}');

  const condition1 = true;
  final set11 = {
    for (var i = 1; i < 5; i++) i,
    if (condition1) 10
  };
  print('set11: $set11');
}

void collections3() {
  print('maps');

  const map1 = {'key1': 1, 'key2': 2, 'key3': 3};
  print('map1: $map1');

  final map2 = Map<String, int>();
  final map3 = <String, int>{};
  final map4 = {};

  final list1 = [1,2,3];
  final map5 = Map<String, int>.fromIterable(
    list1,
    key: (element) => element.toString(),
    value: (element) => element
  );
  print('map5: $map5');

  final list2 = ['item1', 'item2', 'item3'];
  final list3 = [1,2,3];

  final map6 = Map<String, int>.fromIterables(list2, list3);
  print('map6: $map6');

  final entries = [
    MapEntry('item1', 1),
    MapEntry('item2', 2),
    MapEntry('item3', 3)
  ];

  final map7 = Map.fromEntries(entries);
  print('map7: $map7');

  final map8 = UnmodifiableMapView(map7);
  print('map8: $map8');

  final map9 = Map<String, int>.unmodifiable(map7);
  print('map9: $map9');

  final map10 = {
    for (var i = 1; i < 5; i++) 'item $i' : i,
  };
  print('map10: $map10');

  final map11 = {'1': 1, '2': 2, '3': 3};
  map11
  ..update('1', (value) => 11)
  ..update('4', (value) => 44, ifAbsent: () => 44);

  print('map11: $map11');
}

void collections4() {
  print('of() and from()');

  final list1 = List<int>.of([1,2,3]);
  final list2 = <Object>[1,2,3];
  final list3 = List<int>.from(list2);

  print('list1: $list1');
  print('list2: $list2');
  print('list3: $list3');
}

void collections5() {
  print('where, map, toList, reduce');

  final list1 = List<int>.generate(10, (index) => index);

  final list2 = list1
      .where((element) => element.isEven)
      .map((value) => '$value')
      .toList();

  final value1 = list1.reduce((value, element) => value + element);
  final value2 = list1.fold<int>(0, (currentNumber, element) => currentNumber + '$element'.length);

  print('list1: $list1');
  print('list2: $list2');
  print('value1: $value1');
  print('value2: $value2');
}

class A {

}

class B extends A {

}

void collections6() {
  final List<A> list1 = <A>[];
  final List<A> list2 = <B>[];
  // final List<B> list3 = <A>[]; // Compile time error.
}














