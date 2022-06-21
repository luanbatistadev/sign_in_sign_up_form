import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart' as mod;
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/response.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/domain/usecase/sign_in.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/presenter/sign_in_module.dart';

void main() {
  initModule(
    SignInModule(),
  );
  test('deve retornar o usecase sem erro ', () {
    final usecase = mod.Modular.get<SignInImpl>();
    expect(usecase, isA<SignInImpl>());
  });
  test('deve retornar o response sem erro ', () async {
    final usecase = mod.Modular.get<SignInImpl>();
    final result = await usecase.call('Luan', '1234');
    expect(result!.fold(id, id), isA<Response>());
  });
}
