class Sport {}
class Football extends Sport {}
class Volleyball extends Sport {}

sealed class Sport2 {}
class Football2 extends Sport2 {}
class Volleyball2 extends Sport2 {}

void func1() {
  final value = true;

  // Compile time error since not all possible cases for switch is covered.
  // switch (value) {
  //   case true:
  //     print('True');
  // }

  final sport = Football();
  print(_func2(sport));
}

// We need to use default ("_") value to make switch expression handle all possible values
String _func2(Sport sport) {
  return switch (sport) {
    Volleyball _ => 'Volleyball',
    Football _ => 'Football',
    _ => 'Unknown'
  };
}

// Since Sport2 class is sealed we can use just defined values since no other values can be defined from outside
String _func3(Sport2 sport) {
  return switch (sport) {
    Volleyball2 _ => 'Volleyball',
    Football2 _ => 'Football',
  };
}




