// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/auxiliars/user_aux.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/entities/response.dart';
import 'package:sign_in_sign_up_form/app/core/auth/domain/errors/errors.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/domain/repository/sign_up_respository.dart';
import 'package:sign_in_sign_up_form/app/modules/sign_up/infra/datasource/sign_up_datasource.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpDatasource signInDatasource;
  SignUpRepositoryImpl(
    this.signInDatasource,
  );
  @override
  Future<Either<IError, Response>>? signUp(
    UserAuxiliar? userAuxiliar,
  ) async {
    try {
      final result = await signInDatasource.signUp(userAuxiliar);

      return Right(result!);
    } on DataSourceError catch (e) {
      return Left(e);
    } on InvalidCredentials catch (e) {
      return Left(e);
    }
  }
}
