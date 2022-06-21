// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/response.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/errors/errors.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/domain/repository/sign_in_respository.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_in/infra/datasource/sign_in_datasource.dart';

class SignInRepositoryImpl implements SignInRepository {
  final SignInDatasource signInDatasource;
  SignInRepositoryImpl(
    this.signInDatasource,
  );
  @override
  Future<Either<IError, Response>>? signIn(
    String? userName,
    String? password,
  ) async {
    try {
      final result = await signInDatasource.signIn(userName, password);

      return Right(result!);
    } on IError catch (e) {
      return Left(e);
    } 
  }
}
