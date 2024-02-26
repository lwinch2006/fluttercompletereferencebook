import 'package:chapter7/base.dart' as base;

final class Client1 extends base.Client {
  @override
  Future<String> httpRequest() {
    // TODO: implement httpRequest
    throw UnimplementedError();
  }
}

final class Developer extends base.Person {
  const Developer(super.fullName);

  @override
  String toString() => '';
}