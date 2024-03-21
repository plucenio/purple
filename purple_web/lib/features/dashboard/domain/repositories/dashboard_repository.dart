import 'package:dartz/dartz.dart';
import '../../../../lib.dart';
import '../../dashboard.dart';

abstract class IDashboardRepository {
  Future<Either<Failure, bool>> logout();

  Future<Either<Failure, StudioModel>> getStudio({required String studioId});
}
