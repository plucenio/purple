import 'package:dartz/dartz.dart';
import 'package:purple_web/lib.dart';

import '../../dashboard.dart';

abstract class IGetStudioUsecase {
  Future<Either<Failure, Studio>> call({required String studioId});
}

class GetStudioUsecase implements IGetStudioUsecase {
  final IDashboardRepository repository;
  const GetStudioUsecase({required this.repository});

  @override
  Future<Either<Failure, Studio>> call({required String studioId}) async {
    return repository.getStudio(studioId: studioId);
  }
}
