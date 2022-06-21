import 'package:sign_in_sign_up_form/app/core/shared/helpers/specifications/confirm_password_spec.dart';
import 'package:sign_in_sign_up_form/app/core/shared/helpers/value_object/ivalue_object.dart';

class ConfirmPassword implements IValueObject {
  String value;
  String secondValue;

  ConfirmPassword([this.value = '', this.secondValue = '']);

  @override
  String? hasError() {
    if (value.isEmpty) return 'Invalid confirm password';
    if (value != secondValue) return 'Passwords do not match';

    return null;
  }

  @override
  bool get isValid =>
      ConfirmPasswordSpecification().isSatisfiedBy(value, secondValue);
}
