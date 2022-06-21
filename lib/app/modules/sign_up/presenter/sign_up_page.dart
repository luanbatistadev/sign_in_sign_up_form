import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sign_in_sign_up_form/app/core/shared/widgets/custom_text_form_field.dart';
import 'package:sign_in_sign_up_form/app/core/shared/widgets/sign_button_widget.dart';
import 'package:sign_in_sign_up_form/app/core/shared/widgets/sign_navigate_button_widget.dart';
import 'package:sign_in_sign_up_form/app/core/shared/widgets/title_widget.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/presenter/controller/sign_up_controller.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/presenter/sign_up_bloc.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/presenter/states/sign_up_states.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/presenter/widgets/policy_and_privacy_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    Key? key,
  }) : super(key: key);
  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final bloc = Modular.get<SignUpBloc>();
  final formKey = GlobalKey<FormState>();

  bool isTapped = false;

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final SignUpController signUpController = Modular.get<SignUpController>();
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
                                TitleWidget(
                                  title: 'Get Started',
                                  fontSize: isNotMinorHeight ? 30 : 25,
                                ),
                                CustomTextFormField(
                                  label: 'Name',
                                  onChanged: (value) =>
                                      signUpController.name = value.trim(),
                                  validator: (_) =>
                                      signUpController.nameInstance.hasError(),
                                ),
                                CustomTextFormField(
                                  label: 'E-mail',
                                  onChanged: (value) =>
                                      signUpController.email = value.trim(),
                                  validator: (_) =>
                                      signUpController.emailInstance.hasError(),
                                ),
                                CustomTextFormField(
                                  label: 'Password',
                                  isPassWord: true,
                                  onChanged: (value) {
                                    signUpController.password = value.trim();
                                    signUpController
                                            .confirmPasswordSecondValue =
                                        value.trim();
                                  },
                                  validator: (_) => signUpController
                                      .passwordInstance
                                      .hasError(),
                                ),
                                CustomTextFormField(
                                  label: 'Confirm Password',
                                  isPassWord: true,
                                  onChanged: (value) => signUpController
                                      .confirmPassword = value.trim(),
                                  validator: (_) => signUpController
                                      .confirmPasswordInstance
                                      .hasError(),
                                ),
                                const PolicyAndPrivacyWidget(),
                                BlocBuilder(
                                  bloc: bloc,
                                  builder: (context, child) {
                                    return SignButtonWidget(
                                      icon: bloc.state is SignUpLoading
                                          ? CircularProgressIndicator(
                                              backgroundColor: color,
                                            )
                                          : Icon(
                                              CupertinoIcons.arrow_right,
                                              color: color,
                                            ),
                                      title: 'Sign Up',
                                      onPressed: () async {
                                        if (bloc.state is! SignUpLoading) {
                                          if (formKey.currentState!
                                              .validate()) {
                                            await signUpController
                                                .signUp(context);
                                          }
                                        }
                                      },
                                    );
                                  },
                                ),
                                SignNavigateButtonWidget(
                                  title: 'Sign In',
                                  onPressed: () {
                                    Modular.to.pushNamed('/sign_in/');
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
