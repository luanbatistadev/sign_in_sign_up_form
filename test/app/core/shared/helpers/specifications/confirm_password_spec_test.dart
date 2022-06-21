import 'package:flutter_test/flutter_test.dart';
import 'package:sign_in_sign_up_form/app/core/shared/helpers/specifications/confirm_password_spec.dart';

void main() {
  group('Confirm Password Specification Test', () {
    final ConfirmPasswordSpecification confirmPasswordSpecification =
        ConfirmPasswordSpecification();

    test('deve retornar que o confirmPassword não é valido', () {
      expect(
        confirmPasswordSpecification.isSatisfiedBy('Luan', '12'),
        false,
      );
    });
    test('deve retornar que o confirmPassword não é valido', () {
      expect(
        confirmPasswordSpecification.isSatisfiedBy('', ''),
        false,
      );
    });
    test('deve retornar que o confirmPassword é valido', () {
      expect(confirmPasswordSpecification.isSatisfiedBy('anaC*123', 'anaC*123'), true);
    });
  });
}
