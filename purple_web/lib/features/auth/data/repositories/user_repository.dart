import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../lib.dart';

class UserRespository implements IUserRepository {
  final IUserDatasource datasource;

  UserRespository({required this.datasource});
  @override
  Future<Either<Failure, String>> login({required Login login}) async {
    try {
      final logged = await datasource.login(user: LoginModel.fromEntity(login));
      return Right(logged);
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data['error']));
    } catch (e) {
      return Left(ServerFailure(message: 'Ocorreu um erro.'));
    }
  }

  @override
  Future<Either<Failure, bool>> createAccount({required User user}) async {
    try {
      final newAccount =
          await datasource.createAccount(user: UserModel.fromEntity(user));
      return Right(newAccount);
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data['error']));
    } catch (e) {
      return Left(ServerFailure(message: 'Ocorreu um erro.'));
    }
  }
}
