class ValidationHelpers {
  /// Check value is Empty OR Not
  static String? nameField(String? value) {
    if (value!.trim().isEmpty) {
      return 'Enter a Name';
    }
    if (value.trim().length < 2) {
      return 'Enter more Character';
    }
    return null;
  }

  static bool isNumeric(String? value) {
    if (value == null) {
      return false;
    }
    return double.tryParse(value) != null;
  }

  static String? ageValidation(String? value) {
    if (value!.trim().isEmpty) {
      return 'Enter a Age';
    }
    if (!isNumeric(value.replaceAll(' ', ''))) {
      return 'Age should be number only';
    }
    return null;
  }
}
