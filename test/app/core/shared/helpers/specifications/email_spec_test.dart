import 'package:flutter_test/flutter_test.dart';
import 'package:sign_in_sign_up_form/app/core/shared/helpers/specifications/email_spec.dart';

void main() {
  group('Email Specification Test', () {
    final EmailSpecification email = EmailSpecification();

    test('deve retornar que o email não é valido', () {
      expect(email.isSatisfiedBy('Luan'), false);
    });
    test('deve retornar que o email é valido', () {
      expect(email.isSatisfiedBy('test@gmail.com'), true);
    });
  });
}
