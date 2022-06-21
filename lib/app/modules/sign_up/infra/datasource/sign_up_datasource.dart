import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/auxiliares/user_aux.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/response.dart';

abstract class SignUpDatasource {
  Future<Response>? signUp(UserAuxiliar? userAuxiliar);
}
