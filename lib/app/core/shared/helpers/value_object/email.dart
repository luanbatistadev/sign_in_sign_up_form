
import 'package:sign_in_sign_up_form/app/core/shared/helpers/specifications/email_spec.dart';
import 'package:sign_in_sign_up_form/app/core/shared/helpers/value_object/ivalue_object.dart';

class Email implements IValueObject {
  String value;

  Email([this.value = '']);

  @override
  String? hasError() => isValid ? null : 'Invalid email';
  
  @override
  bool get isValid => EmailSpecification().isSatisfiedBy(value);
}
