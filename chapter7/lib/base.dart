abstract base class Client {
  final int timeout;

  Client({this.timeout = 5000}) : assert(timeout > 1000, 'Timeout should be longer then 1 second');

  String get hostname => 'website.com';
  Future<String> httpRequest();
}

base class Person {
  final String fullName;
  const Person(this.fullName);

  @override
  String toString() => 'Full name: $fullName';
}




