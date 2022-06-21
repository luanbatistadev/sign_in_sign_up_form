import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/auxiliars/user_aux.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/response.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/errors/errors.dart';
import 'package:sign_in_sign_up_form/app/core/auth/infra/model/response_model.dart';
import 'package:sign_in_sign_up_form/app/core/shared/utils/data.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/infra/datasource/sign_up_datasource.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/infra/repositories/sign_up_reposytory_impl.dart';

class SignUpDatasourceMock extends Mock implements SignUpDatasource {}

void main() {
  final datasource = SignUpDatasourceMock();
  final repository = SignUpRepositoryImpl(datasource);
  test('deve retornar uma response', () async {
    when(datasource.signUp(any))
        .thenAnswer((_) async => ResponseModel.fromMap(jsonResponse));
    final result = await repository.signUp(
      UserAuxiliar(
        email: 'luan',
        password: 'anaC',
        confirmPassword: 'laun',
        userName: 'luan',
      ),
    );
    expect(result!.fold(id, id), isA<Response>());
  });
  test('deve retornar um datasource error se o data source falhar', () async {
    when(datasource.signUp(any)).thenThrow(InvalidCredentials());
    final result = await repository.signUp(
      UserAuxiliar(
        email: 'luan',
        password: 'anaC',
        confirmPassword: 'laun',
        userName: 'luan',
      ),
    );
    expect(result!.fold(id, id), isA<IError>());
  });
}
