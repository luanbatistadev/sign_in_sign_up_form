import 'package:dartz/dartz.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/response.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/errors/errors.dart';


abstract class SignInRepository {
  Future<Either<IError, Response>>? signIn(
    String? userName,
    String? password,
  );
}
