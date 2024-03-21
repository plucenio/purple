import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../lib.dart';
import '../../dashboard.dart';

class DashboardRespository implements IDashboardRepository {
  final IDashboardDatasource datasource;

  DashboardRespository({required this.datasource});

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      final logged = await datasource.logout();
      return Right(logged);
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data['error']));
    } catch (e) {
      return Left(ServerFailure(message: 'Ocorreu um erro.'));
    }
  }

  @override
  Future<Either<Failure, StudioModel>> getStudio() async {
    try {
      final studio = await datasource.getStudio();
      return Right(studio);
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.data['error']));
    } catch (e) {
      return Left(ServerFailure(message: 'Ocorreu um erro.'));
    }
  }
}
