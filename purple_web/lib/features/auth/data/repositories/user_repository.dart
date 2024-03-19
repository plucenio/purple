import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../lib.dart';

class UserRespository implements IUserRepository {
  final IUserDatasource datasource;

  UserRespository({required this.datasource});
  @override
  Future<Either<Failure, User>> login({required User user}) async {
    try {
      final loggedUser =
          await datasource.login(user: UserModel.fromEntity(user));
      return Right(loggedUser);
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data['error']));
    } catch (e) {
      return Left(ServerFailure(message: 'Ocorreu um erro.'));
    }
  }
}
