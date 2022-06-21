import 'package:sign_in_sign_up_form/app/core/shared/helpers/specifications/string_spec.dart';

class EmailSpecification {
  bool isSatisfiedBy(String? email) {
    if (!StringSpecification().isSatisfiedBy(email) || email!.length < 6) {
      return false;
    } else if (!RegExp(
      r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
    ).hasMatch(email)) {
      return false;
    }

    return true;
  }
}
