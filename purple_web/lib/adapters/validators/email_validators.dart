import 'package:email_validator/email_validator.dart';

class EmailValidatorAdapter {
  static bool validate(String email) {
    return EmailValidator.validate(email);
  }
}
