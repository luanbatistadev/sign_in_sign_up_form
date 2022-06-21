import 'package:sign_in_sign_up_form/app/core/shared/helpers/specifications/string_spec.dart';

class ConfirmPasswordSpecification {
  bool isSatisfiedBy(String? confirmPassword, String password) {
    if (!StringSpecification().isSatisfiedBy(confirmPassword) ||
        !StringSpecification().isSatisfiedBy(password)) {
      return false;
    } else if (confirmPassword != password) {
      return false;
    }

    return true;
  }
}
