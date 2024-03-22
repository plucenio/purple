import 'package:dartz/dartz.dart';
import '../../../../lib.dart';
import '../../dashboard.dart';

abstract class IDashboardRepository {
  Future<Either<Failure, bool>> logout();

  Future<Either<Failure, Studio?>> getStudio();

  Future<Either<Failure, Studio?>> createStudio({required Studio studio});
}
