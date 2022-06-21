import 'package:flutter_test/flutter_test.dart';
import 'package:sign_in_sign_up_form/app/core/shared/helpers/value_object/confirm_password.dart';

void main() {
  group('Confirm Password Test', () {
    final ConfirmPassword confirmPassword = ConfirmPassword();

    test('deve retornar uma mensagem de erro que as senhas não conferem', () {
      confirmPassword.value = '123';
      confirmPassword.secondValue = '12';

      expect(
        confirmPassword.hasError(),
        "Passwords do not match",
      );
    });
    test(
        'deve retornar null quando a password e o confirm Password são iguais!',
        () {
      confirmPassword.value = '123';
      confirmPassword.secondValue = '123';

      expect(confirmPassword.hasError(), null);
    });
  });
}
