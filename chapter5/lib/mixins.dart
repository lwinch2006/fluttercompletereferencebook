class ClassA with StringUtils {
  final String name;
  const ClassA(this.name);
}

mixin StringUtils {
  String replaceWhitespaces(String source) {
    return source.replaceAll(' ', '_');
  }
}






