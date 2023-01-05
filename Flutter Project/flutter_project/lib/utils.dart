class Utils {
  // Regex to check valid password
  static String regexPass =
      "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#\$%^&+=])(?=\\S+\$).{8,20}\$";

  static String regexEmail =
      "^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@" +
          "[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})\$";

  static bool isValidPassword(String password) {
    return RegExp(regexPass).hasMatch(password);
  }

  static bool isValidEmail(String email) {
    return RegExp(regexEmail).hasMatch(email);
  }

  static bool isValidContact(String contact) {
    return contact.length == 10;
  }
}
