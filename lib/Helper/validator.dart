class Validator {
  static String? noValidate({required String value}) {
    return null;
  }

  static String? validateEmpty(
      {required String? value, required String message}) {
    if (value == null) {
      return message;
    }
    if (value.trim().isEmpty) {
      return message;
    }
  }

  static String? validatePassword(
      {required String value, required String message}) {
    if (value.trim().isEmpty) {
      return message;
    } else if (value.length < 6) {
      return message;
    }
  }

  static String? validateGTE({
    required String value,
    required int refValue,
    required String message,
  }) {
    if ((double.tryParse(value) ?? 0) < refValue) {
      return message;
    }
    return null;
  }

  static String? validateAge(
      {required String? value, required String? message}) {
    if (value != null) {
      if ((double.tryParse(value) ?? 0) < 14) {
        return message;
      } else if (value.length > 80) {
        return message;
      }
    }
    return null;
  }

  static String? validateChoice(
      {required dynamic value,
      required dynamic refused,
      required String message}) {
    if (value == refused) {
      return message;
    }
    return null;
  }

  static String? validateChoices(
      {required dynamic value,
      required List<dynamic> refused,
      required String message}) {
    print(refused);
    print(value);
    print(refused.contains(value));
    if (refused.contains(value)) {
      return message;
    }
    return null;
  }

  static String? validateEmail(
      {required String value, required String message}) {
    if (value.trim().isEmpty) {
      return message;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return message;
    }
    return null;
  }

  static String? validatePhone(
      {required String value, required String message}) {
    if (value.trim().isEmpty) {
      return message;
    } else if (!RegExp(
                r'(^\+[0-9]{2}|^\+[0-9]{2}\(0\)|^\(\+[0-9]{2}\)\(0\)|^00[0-9]{2}|^0)([0-9]{9}$|[0-9\-\s]{10}$)')
            .hasMatch(value) ||
        value.length < 10) {
      return message;
    }
  }

  static String? validatePasswordConfirm({
    required String confirm,
    required String pass,
    required String message,
  }) {
    if (confirm.trim().isEmpty) {
      return message;
    } else if (confirm != pass) {
      return message;
    }
    return null;
  }

  static String? validateCode({required String code, required String message}) {
    if (code.trim().isEmpty) {
      return message;
    } else if (code.length < 4) {
      return message;
    }
    return null;
  }

  static String? validateLessThan(
      {required String? value, required String message, required int number,required }) {
    if (value == null) {
      return message;
    }

    if ((double.tryParse(value) ?? 0) < number) {
      return message;
    }
    return null;
  }

  static String? validateDateTime(
      {required DateTime? value,
      required DateTime? otherValue,
      required String? message}) {
    print("vallllllllll$value $otherValue");
    if (value != null && otherValue != null) {
      if (value.isBefore(otherValue) || value.compareTo(otherValue) == 0) {
        return message;
      }
    } else {
      return message;
    }
    return null;
  }
}
