import 'package:flutter_test/flutter_test.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/errors/errors.dart';
import 'package:sign_in_sign_up_form/app/core/auth/infra/model/response_model.dart';
import 'package:sign_in_sign_up_form/app/core/shared/utils/data.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/external/datasource/app_sign_in_datasource.dart';

void main() {
  group('App SignIn DataSource', () {
    test('deve retornar um result', () {
      final AppSignInDatasource appSignInDatasource =
          AppSignInDatasource(ResponseModel.fromMap(jsonResponse));
      final result = appSignInDatasource.signIn('luna', 'luan');
      expect(result, completes);
    });
    test('deve retornar um erro de datasource', () {
      final AppSignInDatasource appSignInDatasource =
          AppSignInDatasource(ResponseModel.fromMap(jsonResponseError));
      final result = appSignInDatasource.signIn('luna', 'luan');
      expect(result, throwsA(isA<IError>()));
    });
  });
}
