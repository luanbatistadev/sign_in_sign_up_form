import 'package:flutter_test/flutter_test.dart';
import 'package:sign_in_sign_up_form/app/core/shared/helpers/value_object/name.dart';

void main() {
  group('Name Test', () {
    final Name name = Name();
    test('deve retornar null quando o name está correto', () {
      name.value = 'Luan Rafael';
      expect(name.hasError(), null);
    });
    
    test('deve retornar erro quando o name inválido', () {
      name.value = 'Luan';
      expect(name.hasError(), 'Invalid name');
    });
  });
}
