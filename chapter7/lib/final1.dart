base class User {
  String firstName;
  String lastName;
  User({required this.firstName, required this.lastName});
}

sealed class UserMapper {
  static User fromJson(Map<String, Object?> jsonAsMap) {
    return User(
        firstName: jsonAsMap['firstName'] as String,
        lastName: jsonAsMap['lastName'] as String
    );
  }
}




