import 'package:dartz/dartz.dart';
import 'package:purple_web/lib.dart';

import '../../dashboard.dart';

abstract class ILinkStudioUsecase {
  Future<Either<Failure, Studio?>> call({required String studioId});
}

class LinkStudioUsecase implements ILinkStudioUsecase {
  final IDashboardRepository repository;
  const LinkStudioUsecase({required this.repository});

  @override
  Future<Either<Failure, Studio?>> call({required String studioId}) async {
    return repository.linkStudio(studioId: studioId);
  }
}
