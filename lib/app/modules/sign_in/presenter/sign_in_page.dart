import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sign_in_sign_up_form/app/core/shared/widgets/custom_text_form_field.dart';
import 'package:sign_in_sign_up_form/app/core/shared/widgets/sign_button_widget.dart';
import 'package:sign_in_sign_up_form/app/core/shared/widgets/sign_navigate_button_widget.dart';
import 'package:sign_in_sign_up_form/app/core/shared/widgets/title_widget.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/presenter/controller/sign_in_controller.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/presenter/sign_in_bloc.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/presenter/states/sign_in_states.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/presenter/widgets/remember_me_forgot_password.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({
    Key? key,
  }) : super(key: key);
  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  final bloc = Modular.get<SignInBloc>();
  bool isTapped = false;

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final SignInController signInController = Modular.get<SignInController>();

    final size = MediaQuery.of(context).size;
    final Color color = Theme.of(context).primaryColor;

    final bool isNotMinorHeight = size.height > 720;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  SizedBox(
                    height: isNotMinorHeight
                        ? size.height * 0.4
                        : size.height * 0.3,
                    width: size.width,
                    child: Image.asset(
                      'assets/images/logo.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: isNotMinorHeight
                            ? size.height * 0.35
                            : size.height * 0.25,
                      ),
                      child: Container(
                        width: size.width,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Form(
                          key: formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: TitleWidget(
                                    title: 'Welcome Back',
                                    fontSize: isNotMinorHeight ? 30 : 25,
                                  ),
                                ),
                                CustomTextFormField(
                                  label: 'E-mail',
                                  onChanged: (value) =>
                                      signInController.email = value.trim(),
                                  validator: (_) =>
                                      signInController.emailInstance.hasError(),
                                ),
                                CustomTextFormField(
                                  label: 'Password',
                                  isPassWord: true,
                                  onChanged: (value) =>
                                      signInController.password = value.trim(),
                                  validator: (_) => signInController
                                      .passwordInstance
                                      .hasError(),
                                ),
                                const RememberMeAndForgotPassword(),
                                BlocBuilder(
                                  bloc: bloc,
                                  builder: (context, child) {
                                    return SignButtonWidget(
                                      icon: bloc.state is SignInLoading
                                          ? CircularProgressIndicator(
                                              backgroundColor: color,
                                            )
                                          : Icon(
                                              CupertinoIcons.arrow_right,
                                              color: color,
                                            ),
                                      title: 'Sign Up',
                                      onPressed: () async {
                                        if (bloc.state is! SignInLoading) {
                                          if (formKey.currentState!
                                              .validate()) {
                                            await signInController
                                                .signIn(context);
                                          }
                                        }
                                      },
                                    );
                                  },
                                ),
                                SignNavigateButtonWidget(
                                  title: 'Sign Up',
                                  onPressed: () {
                                    Modular.to.pushReplacementNamed('/sign_up');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
