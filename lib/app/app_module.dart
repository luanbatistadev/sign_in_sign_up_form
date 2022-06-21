import 'package:flutter_modular/flutter_modular.dart';
import 'package:sign_in_sign_up_form/app/modules/home/home_module.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/presenter/sign_in_module.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/presenter/sign_up_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/sign_up/', module: SignUpModule()),
    ModuleRoute('/sign_in/', module: SignInModule()),
    ModuleRoute('/home/', module: HomeModule()),
  ];
}
