typedef IntegerCache = DataCache<int>;

class DataCache<T> {
  final T data;
  final DateTime creationTime;
  const DataCache(this.data, this.creationTime);
}

// Generic class restricted to just numbers
class NumberCache<T extends num> {
  final T number;
  const NumberCache(this.number);
}

