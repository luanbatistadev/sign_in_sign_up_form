import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/response.dart';
import 'package:sign_in_sign_up_form/app/core/auth/infra/model/response_model.dart';
import 'package:sign_in_sign_up_form/app/core/shared/utils/data.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/domain/repository/sign_in_respository.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/domain/usecase/sign_in.dart';

class SignInRepositoryMock extends Mock implements SignInRepository {}

void main() {
  final repository = SignInRepositoryMock();
  final usecase = SignInImpl(repository);
  group('SignInImpl Test', () {
    test('deve retornar um Response', () async {
      when(repository.signIn(any, any))
          .thenAnswer((_) async => Right(ResponseModel.fromMap(jsonResponse)));
      final result = await usecase.call('Luan', '1234');
      expect(result!.fold(id, id), isA<Response>());
    });
  });
}
