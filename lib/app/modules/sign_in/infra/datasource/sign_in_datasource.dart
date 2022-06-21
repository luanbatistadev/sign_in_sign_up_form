import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/response.dart';

abstract class SignInDatasource {
  Future<Response>? signIn(String? userName, String? password);
}
