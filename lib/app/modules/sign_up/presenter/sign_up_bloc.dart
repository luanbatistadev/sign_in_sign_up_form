// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/auxiliars/user_aux.dart';

import 'package:sign_in_sign_up_form/app/modules/sign_up/domain/usecase/sign_up.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/presenter/states/sign_up_states.dart';

class SignUpBloc extends Bloc<UserAuxiliar, SignUpStates> {
  SignUpBloc(
    this.signUpImpl,
  ) : super(SignUpInitial()) {
    on<UserAuxiliar>((event, emit) async {
      emit(SignUpLoading());
      await Future.delayed(const Duration(seconds: 4), () {});
      final response = await signUpImpl(event);
      emit(
        response!.fold(
          (error) => SignUpError(message: error.toString()),
          (response) => SignUpSuccess(),
        ),
      );
    });
  }

  final SignUpImpl signUpImpl;
}
