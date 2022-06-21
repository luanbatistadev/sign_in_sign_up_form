import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart' as mod;
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/auxiliares/user_aux.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/response.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/domain/usecase/sign_up.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/presenter/sign_up_module.dart';

void main() {
  initModule(
    SignUpModule(),
  );
  test('deve retornar o usecase sem erro ', () {
    final usecase = mod.Modular.get<SignUp>();
    expect(usecase, isA<SignUpImpl>());
  });
  test('deve retornar o response sem erro ', () async {
    final usecase = mod.Modular.get<SignUpImpl>();
    final result = await usecase.call(
      UserAuxiliar(
        email: 'luan',
        password: 'anaC',
        confirmPassword: 'laun',
        userName: 'luan',
      ),
    );
    expect(result!.fold(id, id), isA<Response>());
  });
}
