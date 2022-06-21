import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/auxiliares/user_aux.dart';
import 'package:sign_in_sign_up_form/app/core/auth/infra/model/response_model.dart';
import 'package:sign_in_sign_up_form/app/core/shared/utils/data.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/domain/usecase/sign_in.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/presenter/sign_in_bloc.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/presenter/states/sign_in_states.dart';

class MockSignInImpl extends Mock implements SignInImpl {}

void main() {
  final signInImpl = MockSignInImpl();
  final bloc = SignInBloc(signInImpl);
  test('bloc test', () {
    when(signInImpl(any, any))
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
      isA<SignInInitial>(),
    );
  });
}
