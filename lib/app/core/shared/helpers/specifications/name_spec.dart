import 'package:sign_in_sign_up_form/app/core/shared/helpers/specifications/string_spec.dart';

class NameSpecification {
  bool isSatisfiedBy(String? name) {
    if (!StringSpecification().isSatisfiedBy(name) || name!.length < 6) {
      return false;
    } else if (RegExp(
      r"^/^[a-z ,.'-]+$/i",
    ).hasMatch(name)) {
      return false;
    }

    return true;
  }
}
