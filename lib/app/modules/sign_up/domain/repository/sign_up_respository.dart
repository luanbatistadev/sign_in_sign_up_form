import 'package:dartz/dartz.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/auxiliares/user_aux.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/response.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/errors/errors.dart';

abstract class SignUpRepository {
  Future<Either<IError, Response>>? signUp(
    UserAuxiliar? userAuxiliar,
  );
}
