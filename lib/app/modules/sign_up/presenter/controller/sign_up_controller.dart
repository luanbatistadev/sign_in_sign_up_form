import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/auxiliares/user_aux.dart';
import 'package:sign_in_sign_up_form/app/core/shared/helpers/value_object/confirm_password.dart';
import 'package:sign_in_sign_up_form/app/core/shared/helpers/value_object/email.dart';
import 'package:sign_in_sign_up_form/app/core/shared/helpers/value_object/name.dart';
import 'package:sign_in_sign_up_form/app/core/shared/helpers/value_object/password.dart';
import 'package:sign_in_sign_up_form/app/core/shared/utils/custom_snack_bar.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/presenter/sign_up_bloc.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/presenter/states/sign_up_states.dart';

class SignUpController {
  bool isLoading = false;
  final emailInstance = Email();
  String get email => emailInstance.value;
  set email(String newValue) => emailInstance.value = newValue;

  final passwordInstance = Password();
  String get password => passwordInstance.value;
  set password(String newValue) => passwordInstance.value = newValue;

  final nameInstance = Name();
  String get name => nameInstance.value;
  set name(String newValue) => nameInstance.value = newValue;

  final confirmPasswordInstance = ConfirmPassword();
  String get confirmPassword => confirmPasswordInstance.value;
  String get confirmPasswordSecondValue => confirmPasswordInstance.secondValue;
  set confirmPasswordSecondValue(String newValue) =>
      confirmPasswordInstance.secondValue = newValue;

  set confirmPassword(
    String newValue,
  ) =>
      confirmPasswordInstance.value = newValue;

  Future<void> signUp(BuildContext context) async {
    final bloc = Modular.get<SignUpBloc>();
    bloc.add(
      UserAuxiliar(
        email: email,
        password: password,
        userName: name,
        confirmPassword: confirmPassword,
      ),
    );
    await Future.delayed(const Duration(seconds: 4), () {});

    if (bloc.state is SignUpError) {
      CustomSnackBar().build(
        content: (bloc.state as SignUpError).message,
        duration: 4,
        context: context,
      );
    } else {
      CustomSnackBar().build(
        content: 'User created successfully! Sign in now!',
        duration: 4,
        context: context,
      );
      navigateToSignInPage();
      clean();
    }
  }

  void navigateToSignInPage() {
    Modular.to.pushReplacementNamed('/sign_in/');
  }

  void clean() {
    emailInstance.value = '';
    passwordInstance.value = '';
    nameInstance.value = '';
    confirmPasswordInstance.value = '';
  }
}
