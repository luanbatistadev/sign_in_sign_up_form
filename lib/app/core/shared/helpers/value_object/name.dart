import 'package:sign_in_sign_up_form/app/core/shared/helpers/specifications/name_spec.dart';
import 'package:sign_in_sign_up_form/app/core/shared/helpers/value_object/ivalue_object.dart';

class Name implements IValueObject {
  String value;

  Name([this.value = '']);

  @override
  String? hasError() => isValid ? null : 'Invalid name';
  
  @override
  bool get isValid => NameSpecification().isSatisfiedBy(value);
}
