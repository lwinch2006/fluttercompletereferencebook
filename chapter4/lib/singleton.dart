part of chapter4;

class Singleton {
  static final _instance = Singleton._();

  Singleton._();
  factory Singleton() => _instance;
}
