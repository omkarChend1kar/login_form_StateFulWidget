class ValdiationMixin {
  String? validateEmail(String? value) {
    if (!value!.contains('@')) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }
}
