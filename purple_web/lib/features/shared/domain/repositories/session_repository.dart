import 'package:dartz/dartz.dart';
import '../../../../lib.dart';

abstract class ISessionRepository {
  Future<Either<Failure, bool>> logout();
}
