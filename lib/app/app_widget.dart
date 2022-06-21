import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sign_in_sign_up_form/app/core/shared/utils/themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/sign_up/');
    return MaterialApp.router(
      title: 'Sign In Sign Up Form',
      theme: Themes().lightTheme,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      debugShowCheckedModeBanner: false,
    ); //added by extension
  }
}
