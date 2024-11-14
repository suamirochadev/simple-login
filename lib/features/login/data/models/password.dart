import 'package:formz/formz.dart';

enum PasswordValidationError { empty, invalid, tooShort, noUppercase,noLowerCase, noSpecialChar }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) return PasswordValidationError.empty;
    if (value.length < 8) return PasswordValidationError.tooShort;
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return PasswordValidationError.noUppercase;
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return PasswordValidationError.noLowerCase;
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return PasswordValidationError.noSpecialChar;
    }
    return null;
  }
}
