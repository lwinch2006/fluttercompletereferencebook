part of chapter4;

class _GreetingPrinter {
  const _GreetingPrinter();

  void call(String name) {
    print('Greetings, $name');
  }
}

const printGreeting = _GreetingPrinter();
