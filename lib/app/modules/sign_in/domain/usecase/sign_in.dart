import 'package:dartz/dartz.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/response.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/errors/errors.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/domain/repository/sign_in_respository.dart';

abstract class SignIn {
  Future<Either<IError, Response>>? call(String userName, String password);
}

class SignInImpl implements SignIn {
  final SignInRepository signInRepository;
  SignInImpl(
    this.signInRepository,
  );
  @override
  Future<Either<IError, Response>>? call(
    String? userName,
    String? password,
  ) async {
    return signInRepository.signIn(userName, password)!;
  }
}
