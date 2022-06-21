import 'package:flutter_test/flutter_test.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/auxiliares/user_aux.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/errors/errors.dart';
import 'package:sign_in_sign_up_form/app/core/auth/infra/model/response_model.dart';
import 'package:sign_in_sign_up_form/app/core/shared/utils/data.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/external/datasource/app_sign_up_datasource.dart';

void main() {
  group('App SignIn DataSource', () {
    test('deve retornar um result', () {
      final AppSignUpDatasource appSignUpDatasource =
          AppSignUpDatasource(ResponseModel.fromMap(jsonResponse));
      final result = appSignUpDatasource.signUp(
        UserAuxiliar(
          email: 'luan',
          password: 'anaC',
          confirmPassword: 'laun',
          userName: 'luan',
        ),
      );
      expect(result, completes);
    });
    test('deve retornar um erro de datasource', () {
      final AppSignUpDatasource appSignUpDatasource =
          AppSignUpDatasource(ResponseModel.fromMap(jsonResponseError));
      final result = appSignUpDatasource.signUp(
        UserAuxiliar(
          email: '',
          password: '',
          confirmPassword: '',
          userName: '',
        ),
      );
      expect(result, throwsA(isA<IError>()));
    });
  });
}
