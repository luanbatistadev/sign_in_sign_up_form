import 'package:sign_in_sign_up_form/app/core/shared/helpers/specifications/string_spec.dart';

class PasswordSpecification {
  bool isSatisfiedBy(String? password) {
    if (!StringSpecification().isSatisfiedBy(password) || password!.length < 8) {
      return false;
    } else if (!RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    ).hasMatch(password)) {
      return false;
    }

    return true;
  }
}
