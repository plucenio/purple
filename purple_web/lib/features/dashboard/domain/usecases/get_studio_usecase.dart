import 'package:dartz/dartz.dart';
import 'package:purple_web/lib.dart';

import '../../dashboard.dart';

abstract class IGetStudioUsecase {
  Future<Either<Failure, Studio>> call();
}

class GetStudioUsecase implements IGetStudioUsecase {
  final IDashboardRepository repository;
  const GetStudioUsecase({required this.repository});

  @override
  Future<Either<Failure, Studio>> call() async {
    return repository.getStudio();
  }
}
