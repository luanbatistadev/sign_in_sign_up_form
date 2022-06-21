// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/auxiliares/user_aux.dart';

import 'package:sign_in_sign_up_form/app/modules/sign_in/domain/usecase/sign_in.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/presenter/states/sign_in_states.dart';

class SignInBloc extends Bloc<UserAuxiliar, SignInStates> {
  SignInBloc(
    this.signInImpl,
  ) : super(SignInInitial()) {
    on<UserAuxiliar>((event, emit) async {
      emit(SignInLoading());
      await Future.delayed(const Duration(seconds: 4), () {});
      final response = await signInImpl(event.email, event.password);
      emit(
        response!.fold(
          (error) => SignInError(message: error.toString()),
          (response) => SignInSuccess(),
        ),
      );
    });
  }

  final SignInImpl signInImpl;
}
