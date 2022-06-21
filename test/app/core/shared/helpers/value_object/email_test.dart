import 'package:flutter_test/flutter_test.dart';
import 'package:sign_in_sign_up_form/app/core/shared/helpers/value_object/email.dart';

void main() {
  group('Email Test', () {
    final Email email = Email();
    test('deve retornar um erro de email invalido', () {
      email.value = '';
      expect(email.hasError(), 'Invalid email');
      email.value = 'luan';
      expect(email.hasError(), 'Invalid email');
    });
    test('deve retornar null quando é válido', () {
      email.value = 'test@gmail.com';
      expect(email.hasError(), null);
      
    });
  });
}
