import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/auxiliars/user_aux.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/response.dart';
import 'package:sign_in_sign_up_form/app/core/auth/infra/model/response_model.dart';
import 'package:sign_in_sign_up_form/app/core/shared/utils/data.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/domain/repository/sign_up_respository.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/domain/usecase/sign_up.dart';

class SignUpRepositoryMock extends Mock implements SignUpRepository {}

void main() {
  final repository = SignUpRepositoryMock();
  final usecase = SignUpImpl(repository);
  group('SigUsignUpImpl Test', () {
    test('deve retornar um Response', () async {
      when(repository.signUp(any))
          .thenAnswer((_) async => Right(ResponseModel.fromMap(jsonResponse)));
      final result = await usecase.call(UserAuxiliar());
      expect(result!.fold(id, id), isA<Response>());
    });
  });
}
