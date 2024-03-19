import 'package:dartz/dartz.dart';
import '../../../../lib.dart';

abstract class IUserRepository {
  Future<Either<Failure, String>> login({required Login login});

  Future<Either<Failure, bool>> createAccount({required User user});
}
