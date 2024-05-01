// Project imports:
import 'text_constant.dart';

class ValidatonFunction {
  static bool isFiledEmpty(String? value) {
    return value == null || value.isEmpty;
  }

  static String? validateEmail(String? value) {
    if (isFiledEmpty(value)) {
      return TextConstant.inputEmpty;
    } else if (!TextConstant.validateEmail.hasMatch(value!)) {
      return TextConstant.emailError;
    }
    return null;
  }

  static String? validateName(String? value) {
    if (isFiledEmpty(value)) {
      return TextConstant.inputEmpty;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (isFiledEmpty(value)) {
      return TextConstant.inputEmpty;
    } else if (value!.length < 6) {
      return TextConstant.passwordError;
    } else if (!TextConstant.validatePassword.hasMatch(value)) {
      return TextConstant.passwordError2;
    }
    return null;
  }
}
