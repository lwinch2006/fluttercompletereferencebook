final class Validator {
  static String? validateEmail(String? value) {
    if (!(value?.contains('@') == true)) {
      return 'Username should be email';
    }
  }

  static String? validatePassword(String? value) {
    if (value?.isEmpty == true) {
      return 'Password cannot be empty';
    }
  }
}