import 'package:flutter_test/flutter_test.dart';
import 'package:sign_in_sign_up_form/app/core/shared/helpers/specifications/string_spec.dart';

void main() {
  group('String Specification Test', () {
    test('deve retornar que o string não é valido', () {
      expect(StringSpecification().isSatisfiedBy(''), false);
    });
    test('deve retornar que o string não é valido', () {
      expect(StringSpecification().isSatisfiedBy(null), false);
    });
    test('deve retornar que o string é valido', () {
      expect(StringSpecification().isSatisfiedBy('Luan Rafael'), true);
    });
  });
}
