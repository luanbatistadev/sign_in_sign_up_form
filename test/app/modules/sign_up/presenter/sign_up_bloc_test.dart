import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/auxiliares/user_aux.dart';
import 'package:sign_in_sign_up_form/app/core/auth/infra/model/response_model.dart';
import 'package:sign_in_sign_up_form/app/core/shared/utils/data.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/domain/usecase/sign_up.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/presenter/sign_up_bloc.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/presenter/states/sign_up_states.dart';

class MockSignUpImpl extends Mock implements SignUpImpl {}

void main() {
  final signUpImpl = MockSignUpImpl();
  final bloc = SignUpBloc(signUpImpl);
  test('bloc test', () {
    when(signUpImpl(any))
        .thenAnswer((_) async => Right(ResponseModel.fromMap(jsonResponse)));

    bloc.add(
      UserAuxiliar(
        userName: 'luan',
        password: 'anaC',
        email: 'luan',
        confirmPassword: 'laun',
      ),
    );

    expectLater(
      bloc.state,
      isA<SignUpInitial>(),
    );
  });
}
