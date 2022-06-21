import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/response.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/errors/errors.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/infra/datasource/sign_in_datasource.dart';

class AppSignInDatasource implements SignInDatasource {
  final Response response;
  AppSignInDatasource(
    this.response,
  );

  @override
  Future<Response>? signIn(String? userName, String? password) async {
    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 401) {
      throw InvalidCredentials();
    } else {
      throw DataSourceError();
    }
  }
}
