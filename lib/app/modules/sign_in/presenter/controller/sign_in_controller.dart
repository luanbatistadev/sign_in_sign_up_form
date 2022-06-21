import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/auxiliars/user_aux.dart';
import 'package:sign_in_sign_up_form/app/core/shared/helpers/value_object/email.dart';
import 'package:sign_in_sign_up_form/app/core/shared/helpers/value_object/password.dart';
import 'package:sign_in_sign_up_form/app/core/shared/utils/custom_snack_bar.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/presenter/sign_in_bloc.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/presenter/states/sign_in_states.dart';


class SignInController  {
  final emailInstance = Email();
  String get email => emailInstance.value;
  set email(String newValue) => emailInstance.value = newValue;

  final passwordInstance = Password();
  String get password => passwordInstance.value;
  set password(String newValue) => passwordInstance.value = newValue;

  Future<void> signIn(BuildContext context) async {
    final bloc = Modular.get<SignInBloc>();
    bloc.add(UserAuxiliar(email: email, password: password));
    await Future.delayed(const Duration(seconds: 4), () {});

    if (bloc.state is SignInError) {
      CustomSnackBar().build(
        content: (bloc.state as SignInError).message,
        duration: 4,
        context: context,
      );
    } else {
      CustomSnackBar().build(
        content: 'You logged in!',
        duration: 4,
        context: context,
      );
      navigateToHomePage();
      clean();
    }
  }

  void navigateToHomePage() {
    Modular.to.pushReplacementNamed('/home/');
  }

  void clean() {
    emailInstance.value = '';
    passwordInstance.value = '';
  }
}
