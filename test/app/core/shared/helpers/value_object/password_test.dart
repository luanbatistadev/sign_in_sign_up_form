import 'package:flutter_test/flutter_test.dart';
import 'package:sign_in_sign_up_form/app/core/shared/helpers/value_object/password.dart';

void main() {
  group('Password Test', () {
    final Password password = Password();
    test('deve retornar null quando a senha é aceitável', () {
    
      password.value = 'anaC*123';
      expect(password.hasError(), null);
    });
    test('deve retornar erro quando a senha não tem o tamanho suficiente!', () {
      
      password.value = 'ana';
      expect(password.hasError(), 'Password must be at least 8 characters');
    });
    test('deve retornar erro quando a senha está vazia', () {
     
      password.value = '';
      expect(password.hasError(), 'Password is required');
    });
    test('deve retornar erro quando a senha não tem os caracteres especificos!', () {
     
      password.value = 'aaaaaaaaa(aa';
      expect(password.hasError(), 'Should contain at least one upper case, one special character, one number and one lower case letter');
    });
  });
}
