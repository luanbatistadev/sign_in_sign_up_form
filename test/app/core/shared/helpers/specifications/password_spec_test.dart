import 'package:flutter_test/flutter_test.dart';
import 'package:sign_in_sign_up_form/app/core/shared/helpers/specifications/password_spec.dart';

void main() {
  group('Password Specification Test', () {
    final PasswordSpecification passwordSpecification = PasswordSpecification();

    test('deve retornar que o password não é valido', () {
      expect(
        passwordSpecification.isSatisfiedBy('Luan'),
        false,
      );
    });
    test('deve retornar que o password não é valido', () {
      expect(passwordSpecification.isSatisfiedBy('Luan Rafael '), false);
    });
    test('deve retornar que o password é valido', () {
      expect(passwordSpecification.isSatisfiedBy('anaC*123'), true);
    });
  });
}
