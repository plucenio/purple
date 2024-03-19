import 'package:dartz/dartz.dart';
import '../../../../lib.dart';

abstract class IUserRepository {
  Future<Either<Failure, User>> login({required User user});
}
