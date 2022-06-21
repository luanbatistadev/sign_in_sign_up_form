import 'package:sign_in_sign_up_form/app/core/shared/helpers/specifications/password_spec.dart';
import 'package:sign_in_sign_up_form/app/core/shared/helpers/value_object/ivalue_object.dart';

class Password implements IValueObject {
  String value;

  Password([this.value = '']);

  @override
  String? hasError() {
    if (value.isEmpty) return 'Password is required';
    if (value.length < 8) return 'Password must be at least 8 characters';
    if (!RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    ).hasMatch(value)) {
      return 'Should contain at least one upper case, one special character, one number and one lower case letter';
    }
    return null;
  }

  @override
  bool get isValid => PasswordSpecification().isSatisfiedBy(value);
}
