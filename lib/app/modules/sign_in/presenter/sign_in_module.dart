import 'package:flutter_modular/flutter_modular.dart';
import 'package:sign_in_sign_up_form/app/core/auth/infra/model/response_model.dart';
import 'package:sign_in_sign_up_form/app/core/shared/utils/data.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/domain/usecase/sign_in.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/external/datasource/app_sign_in_datasource.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/infra/repositories/sign_in_reposytory_impl.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/presenter/controller/sign_in_controller.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/presenter/sign_in_bloc.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/presenter/sign_in_page.dart';

class SignInModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => SignInController()),
    Bind.singleton((i) => ResponseModel.fromMap(jsonResponse)),
    Bind.singleton((i) => SignInRepositoryImpl(i())),
    Bind.singleton((i) => SignInImpl(i())),
    Bind.singleton((i) => AppSignInDatasource(i())),
    Bind.singleton((i) => SignInBloc(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const SignInPage()),
  ];
}
