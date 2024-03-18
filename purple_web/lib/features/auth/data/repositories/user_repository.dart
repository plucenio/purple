import 'package:dartz/dartz.dart';

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
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
