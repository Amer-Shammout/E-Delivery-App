import 'package:e_delivery_app/generated/l10n.dart';

abstract class Validation {
  static String? validatePhoneNumber(String? phoneNumber, context) {
    final RegExp regExp = RegExp(r'^\9[0-9]{8}$');

    if (phoneNumber == null || phoneNumber == '') {
      return S.of(context).field_empty_message;
    }

    if (!regExp.hasMatch(phoneNumber)) {
      return S.of(context).phone_number_message;
    }

    return null;
  }

  static String? validateFieldIfEmpty(String? value, context) {
    if (value == '' || value == null) {
      return S.of(context).field_empty_message;
    }
    return null;
  }

  static String? validateFullName(String? fullName, context) {
    if (fullName == null || fullName == '') {
      return S.of(context).field_empty_message;
    }

    final regex = RegExp(
        r'^[\u0621-\u064A\u0660-\u066F A-Za-z]+(?: [\u0621-\u064A\u0660-\u066F A-Za-z]+){0,2}$');

    final words = fullName.split(' ');
    if (words.length > 3 || !regex.hasMatch(fullName)) {
      return S.of(context).full_name_message;
    }
    return null;
  }
}
