import 'package:dartz/dartz.dart';
import 'package:purple_web/lib.dart';

import '../../dashboard.dart';

abstract class ICreateStudioUsecase {
  Future<Either<Failure, Studio?>> call({required Studio studio});
}

class CreateStudioUsecase implements ICreateStudioUsecase {
  final IDashboardRepository repository;
  const CreateStudioUsecase({required this.repository});

  @override
  Future<Either<Failure, Studio?>> call({required Studio studio}) async {
    return repository.createStudio(studio: studio);
  }
}
