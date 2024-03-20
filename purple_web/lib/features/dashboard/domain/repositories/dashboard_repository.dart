import 'package:dartz/dartz.dart';
import '../../../../lib.dart';

abstract class IDashboardRepository {
  Future<Either<Failure, bool>> logout();
}
