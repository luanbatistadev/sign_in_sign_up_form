import 'package:flutter_modular/flutter_modular.dart';
import 'package:sign_in_sign_up_form/app/core/auth/infra/model/response_model.dart';
import 'package:sign_in_sign_up_form/app/core/shared/utils/data.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/domain/usecase/sign_up.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/external/datasource/app_sign_up_datasource.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/infra/repositories/sign_up_reposytory_impl.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/presenter/controller/sign_up_controller.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/presenter/sign_up_bloc.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/presenter/sign_up_page.dart';

class SignUpModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => SignUpController()),
    Bind.singleton((i) => ResponseModel.fromMap(jsonResponse)),
    Bind.singleton((i) => SignUpRepositoryImpl(i())),
    Bind.singleton((i) => SignUpImpl(i())),
    Bind.singleton((i) => AppSignUpDatasource(i())),
    Bind.singleton((i) => SignUpBloc(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const SignUpPage()),
  ];
}
