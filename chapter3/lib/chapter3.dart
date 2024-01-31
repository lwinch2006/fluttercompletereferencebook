void switches() {
  print('');
  print('Switch');
  const num = 111;

  switch (num) {
    case 111:
      print('111');
      break;  // optional
    case 222:
      print('222');
      break;  // optional
    case 333:
      print('333');
      break;  // optional
  }

  switch (num) {
    case 111:
      print('111');
    case 222:
      print('222');
    case 333:
      print('333');
  }
}

void loops() {
  print('');
  print('Loops');

  final letters = ['A', 'B', 'C'];

  for(final letter in letters) {
    print('Letter: $letter');
  }
}

void functions() {
  print('');
  print('Functions');

  void func1(int a) => print('$a*$a: ${a*a}');
  func1(2);

  void func2() => 'Hello World'; // return 'Hello World' is ignored as function return type is void
  String func3() => 'Hello World';

  print('Test 1: ${func2() as String}'); // This will work
  print('Test 2: ${func3()}'); // This will work

  void Function(int) testFuncAsVariable;
  // testFuncAsVariable(6); // Not nullable variable should be initialized first
  testFuncAsVariable = func1;
  testFuncAsVariable(3);

  print('functions() type: ${functions.runtimeType}');

  void func4() => {};
  func5() => {};
  print('func4 type: ${func4.runtimeType}');
  print('func5 type: ${func5.runtimeType}');

  compareFunc(int a, int b) => a == b;
  print('compareFunc type: ${compareFunc.runtimeType}');

  final void Function(int) testFuncAsVariable2 = func1;
  print('testFuncAsVariable2 type: ${testFuncAsVariable2.runtimeType}');
  testFuncAsVariable2(4);
}

void optionalNamedParameters() {
  print('');
  print('Optional named parameters in functions');

  // This is similar to below declaration of test2
  void Function({int param1, int param2}) test1 = ({int param1 = 0, int param2 = 0}) {
    print('Param 1: $param1');
    print('Param 2: $param2');
  };

  // This is similar to below declaration of test1
  test2({int param1 = 0, int param2 = 0}) {
    print('Param 1: $param1');
    print('Param 2: $param2');
  }

  print('Calling test1()');
  test1(param1: 111, param2: 222);

  print('');
  print('Calling test2()');
  test2(param1: 111);

  test3({int? param1, int? param2}) {
    print('Param 1: $param1');
    print('Param 2: $param2');
  }

  print('');
  print('Calling test3()');
  test3(param1: 111);

  test4({int? param1, required int? param2}) {
    print('Param 1: $param1');
    print('Param 2: $param2');
  }

  print('');
  print('Calling test4()');
  // test4(param1: 111); // named param2 is required here
  test4(param1: 111, param2: 222);

  //test5({int param1 = 0, required int param2 = 0}) { // required named parameter cannot have default value
  test5({int param1 = 0, required int param2}) {
    print('Param 1: $param1');
    print('Param 2: $param2');
  }

  print('');
  print('Calling test4()');
  //test5(param1: 111); // named param2 is required here
  test5(param1: 111, param2: 222);


  test6({
    required int value,
    required void Function() onsuccess,
    required void Function()? onerror,
  }) {
    final int result = value % 2;

    if (result == 0) {
      onsuccess();
    } else if (onerror != null) {
      onerror();
    }
  }

  print('');
  print('Calling test6(5)');
  test6(
    value: 5,
    onsuccess: () {
      print('Value is even');
    },
    onerror: () {
      print('Value is odd');
    }
  );

  print('');
  print('Calling test6(8)');
  test6(
      value: 8,
      onsuccess: () {
        print('Value is even');
      },
      onerror: () {
        print('Value is odd');
      }
  );

  test7(int param0, {int? param1, int? param2}) {
    print('Param 0: $param0');
    print('Param 1: $param1');
    print('Param 2: $param2');
  }

  print('');
  print('Calling test7()');
  test7(000, param1: 111);
}

void optionalPositionalParameters() {
  print('');
  print('Optional positional parameters in functions');

  test1(int param0, [int? param1, int? param2]) {
    print('Param 0: $param0');
    print('Param 1: $param1');
    print('Param 2: $param2');
  }

  print('');
  print('Calling test1()');
  test1(000, 111);
}

void nestedFunctions() {
  print('');
  print('Nested functions');

  test1(int param0) {
    print('Param0: $param0');
    test11(int param0) {
      print('Param0 * Param0: ${param0*param0}');
    }
    test11(param0);
  }

  print('');
  print('Calling test1()');
  test1(2);
}

void assertions() {
  print('');
  print('Assertions');

  test1(int param0) {
    assert(param0 != 0, 'value cannot be zero');
    print('Param0:  ${100 / param0}');
  }

  print('');
  print('Calling test1()');
  test1(33);
  // test1(0); // This will lead to exception in assert() function
}

typedef StringList = List<String>;

void typeAliases() {
  print('');
  print('Type aliases');

  StringList test1 = ['a', 'b', 'c'];
  print('StringList type: ${test1.runtimeType}');
}

void unUsualConstructions() {
  print('');
  print('Unusual constructions');
  var index = 0;

  for (;;) {
    print('Index: $index');
    index++;
    if (index >= 3) {
      break;
    }
  }

  var value = 1;

  switch (value) {
    world:
    case 0:
      print('world');
    case 1:
      print('hello');
      continue world;
    default:
      print('no message');
  }

  outer:
  for (var i = 0; i < 3; i++) {
    print('outer: $i');

    inner:
    for (var j = 0; j < 3; j++) {
      print('inner: $j');

      if (j == 1) {
        // break inner; // breaks inner loop, same as simple break
        // break outer; // breaks outer loop, exists both loops
        // continue inner; // continues inner loop, same as simple continue
        // continue outer; // continues outer loop, same as break inner or simple break
      }
    }
  }
}


