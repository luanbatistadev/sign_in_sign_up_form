import 'package:dartz/dartz.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/auxiliares/user_aux.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/response.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/errors/errors.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/domain/repository/sign_up_respository.dart';

abstract class SignUp {
  Future<Either<IError, Response>>? call(UserAuxiliar? userAuxiliar);
}

class SignUpImpl implements SignUp {
  final SignUpRepository signUpRepository;
  SignUpImpl(
    this.signUpRepository,
  );
  @override
  Future<Either<IError, Response>>? call(
    UserAuxiliar? userAuxiliar,
  ) async {
    return signUpRepository.signUp(userAuxiliar)!;
  }
}
