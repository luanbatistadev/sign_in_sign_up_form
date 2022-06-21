import 'package:flutter_test/flutter_test.dart';
import 'package:sign_in_sign_up_form/app/core/shared/helpers/specifications/name_spec.dart';

void main() {
  group('Name Specification Test', () {
    final NameSpecification name = NameSpecification();

    test('deve retornar que o name não é valido', () {
      expect(
        name.isSatisfiedBy('Luan'),
        false,
      );
    });
    test('deve retornar que o name é valido', () {
      expect(name.isSatisfiedBy('Luan Rafael '), true);
    });
  });
}
