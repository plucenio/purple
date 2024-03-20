import 'package:dartz/dartz.dart';
import '../domain.dart';

abstract class IUserRepository {
  Future<Either<Failure, bool>> createAccount({required User user});

  Future<Either<Failure, String>> login({required Login login});
}
