typedef IntegerCache = DataCache<int>;

class DataCache<T> {
  final T data;
  final DateTime creationTime;
  const DataCache(this.data, this.creationTime);
}



