import 'dart:convert';

int calculate() {
  return 6 * 7;
}

void variables() {
  print("\nVariables");

  var name1 = "John Doe";
  var age1 = 30;

  String name2 = "John Doe";
  int age2 = 30;

  Object name3 = "John Doe";
  Object age3 = 30;

  dynamic name4 = "John Doe";
  dynamic age4 = 30;

  final age5 = 30;

  const age6 = 30;

  const double age7 = 30; // Type overriding, double instead of int

  print("Runtime type name1: ${name1.runtimeType}");
  print("Runtime type age1: ${age1.runtimeType}");

  print("Runtime type name2: ${name2.runtimeType}");
  print("Runtime type age2: ${age2.runtimeType}");

  print("Runtime type name3: ${name3.runtimeType}");
  print("Runtime type age3: ${age3.runtimeType}");

  print("Runtime type name4: ${name4.runtimeType}");
  print("Runtime type age4: ${age4.runtimeType}");

  print("Runtime type age5: ${age5.runtimeType}");

  print("Runtime type age6: ${age6.runtimeType}");

  print("Runtime type age7: ${age7.runtimeType}");
}

int? getNotNullValue() {
  return 5;
}

int? getNullValue() {
  return null;
}

void nullSafety() {
  print("\nNULL Safety");

  int? age1 = 25;
  age1 = null;

  String? name1;
  name1 = "John Doe";

  int? age2 = 25;

  int age3 = getNotNullValue()!;

  //int age4 = getNullValue()!; // Runtime error
}

void numbers() {
  print("\nNumbers");

  final num1 = 12;
  final num2 = 0x12;
  final num3 = 1e5;

  final num4 = 7.62;
  final num5 = 1.5e-5;

  num num6 = 12.34;
  print("Runtime type num6: ${num6.runtimeType}");

  num6 = 6;
  print("Runtime type num6: ${num6.runtimeType}");



}

void strings() {
  print('\nStrings');

  String name1 = 'John';
  String name2 = "John";
  String char1 = name1[0];

  print('Name: $name1');
  print('Name runtime type: ${name1.runtimeType}');

  String query1 = '''
    SELECT *
    FROM [Users]
    WHERE [Name] = $name1
  ''';

  String query2 = """
    SELECT *
    FROM [Users]
    WHERE [Name] = $name1
  """;

  print('query1: \n$query1');
  print('query2: \n$query2');

  String name3 = 'I am \n25 years old';
  String name4 = 'I am \t25 years old';

  print(name3);
  print(name4);

  print(r'I am \n25 years old'); // Raw string
  print(r'I am \t25 years old'); // Raw string

  // Very inefficient way to create a string
  // var value = '';
  // for (var i = 0; i < 9000000; i++) {
  //   value += '$i \n';
  // }
  // print(value);

  // Efficient way to work with strings
  // final value = StringBuffer();
  // for (var i = 0; i < 9000000; i++) {
  //   value.writeln('$i, ');
  // }
  // print(value.toString());

  const value2 = '12';

  final num1 = int.tryParse(value2);
  final num2 = int.tryParse(value2, radix: 16); // radix is base: bin, oct, hex,...
  final num3 = double.tryParse(value2);

  final num4 = int.tryParse('');
  final num5 = double.tryParse('');

  final num1AsString = num1.toString();
  final num2AsString = num2.toString();
  final num3AsString = num3.toString();

  final num4AsString = num4.toString();
  final num5AsString = num5.toString();

  print('');
  print('num1: $num1');
  print('num2: $num2');
  print('num3: $num3');
  print('num4: $num4');
  print('num5: $num5');

  print('num1AsString: $num1AsString');
  print('num2AsString: $num2AsString');
  print('num3AsString: $num3AsString');
  print('num4AsString: $num4AsString');
  print('num5AsString: $num5AsString');

  print('1.23 (fixed(3)): ${1.23.toStringAsFixed(3)}');
  print('1.23 (precision(3)): ${1.23.toStringAsPrecision(3)}');
  print('12.34 (exponential(2)): ${12.34.toStringAsExponential(2)}');
  print('2748 (hex): ${2748.toRadixString(16)}');

  const value3 = 'Hæ';

  print('');
  print('H code: ${value3.codeUnitAt(0)}');
  print('æ code: ${value3.codeUnitAt(1)}');

  print('Number of bytes in Hæ: ${utf8.encode(value3).length}');

  print('Hæ from char codes: ${String.fromCharCodes([72, 230])}');

  print('Hæ char codes: ${'Hæ'.runes.toList()}');

  print('Hæ from hex char code: ${'\u0048''\u00E6'}');

  print('Emoji (can not be output in default console): ${'\u1f606'}');
}

enum Weekdays {
  mon('Monday'),
  tue('Tuesday'),
  wed('Wednesday'),
  thr('Thursday'),
  fri('Friday'),
  sat('Saturday'),
  sun('Sunday');

  final String displayName;

  const Weekdays(this.displayName);
  static String dayNumberToDisplayName(int index) {
    return Weekdays.values[index-1].displayName;
  }

}

void enums() {
  print('\n');
  print('Enums');
  var enum1 = Weekdays.mon;

  print('Monday: $enum1');
  print('Monday (name): ${enum1.name}');
  print('Monday (index): ${enum1.index}');

  print('Tuesday from string: ${Weekdays.values.byName('tue')}');

  print('Weekdays.wed (display name): ${Weekdays.wed.displayName}');

  print('Weekdays number 3 (display name): ${Weekdays.dayNumberToDisplayName(3)}');
}

void lists() {
  print('\n');
  print('Lists');
  var list1 = [1,2,3];
  var list2 = ['1', '2', '3'];

  print(list1);
  print(list2);
}

void environmentVariables() {
  // Use shell script run configuration for this
  print('\n');
  print('Environment variables');
  print('ASP.NET environment: ${String.fromEnvironment('ASPNETCORE_ENVIRONMENT', defaultValue: 'Unknown')}');
}

void operators() {
  print('\n');
  print('Operators');
  print('9/4: ${9/4}');
  print('9~/4: ${9~/4}');
  print('(9/4).toInt(): ${(9/4).toInt()}'); // ~/ is more efficient then toInt()

  print('9 is not string: ${9 is! String}');

  var x1, y1 = 2;
  print('x and y: ${'$x1 and $y1'}');

  var x2 = 1, y2 = 2;
  print('x and y: ${'$x2 and $y2'}');




}












