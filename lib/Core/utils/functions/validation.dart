abstract class Validation {
  static String? validatePhoneNumber(String? phoneNumber) {
    final RegExp regExp = RegExp(r'^\9[0-9]{8}$');

    if (phoneNumber == null || phoneNumber == '') {
      return 'field is required';
    }

    if (!regExp.hasMatch(phoneNumber)) {
      return 'please enter a valid phone number';
    }

    return null;
  }
}
