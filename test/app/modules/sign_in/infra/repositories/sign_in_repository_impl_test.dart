import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/response.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/errors/errors.dart';
import 'package:sign_in_sign_up_form/app/core/auth/infra/model/response_model.dart';
import 'package:sign_in_sign_up_form/app/core/shared/utils/data.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/infra/datasource/sign_in_datasource.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/infra/repositories/sign_in_repository_impl.dart';

class SignInDatasourceMock extends Mock implements SignInDatasource {}

void main() {
  final datasource = SignInDatasourceMock();
  final repository = SignInRepositoryImpl(datasource);
  test('deve retornar uma response', () async {
    when(datasource.signIn(any, any))
        .thenAnswer((_) async => ResponseModel.fromMap(jsonResponse));
    final result = await repository.signIn('Luan', '1234');
    expect(result!.fold(id, id), isA<Response>());
  });
  test('deve retornar um datasource error se o data source falhar', () async {
    when(datasource.signIn(any, any)).thenThrow(InvalidCredentials());
    final result = await repository.signIn('Luan', '1234');
    expect(result!.fold(id, id), isA<IError>());
  });
}
