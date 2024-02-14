void example1() {
  const record = ('Hello', isGreeting: true, 'World');
  print('${record.$1} ${record.$2}');
  print('Is greeting: ${record.isGreeting}');
}

void example2() {
  (String, String, {bool isGreeting}) record = ('Hello', isGreeting: true, 'World');
  print('${record.$1} ${record.$2}');
  print('Is greeting: ${record.isGreeting}');

  (String, String, {bool isGreeting}) record2 = ('Hello', 'World', isGreeting: true);
  print('${record2.$1} ${record2.$2}');
  print('Is greeting: ${record2.isGreeting}');
}

