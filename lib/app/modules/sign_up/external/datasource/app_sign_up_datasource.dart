import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/auxiliars/user_aux.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/response.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/errors/errors.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/infra/datasource/sign_up_datasource.dart';

class AppSignUpDatasource implements SignUpDatasource {
  final Response response;
  AppSignUpDatasource(
    this.response,
  );

  @override
  Future<Response>? signUp(UserAuxiliar? userAuxiliar) async {
    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 401) {
      throw InvalidCredentials();
    } else {
      throw DataSourceError();
    }
  }
}
