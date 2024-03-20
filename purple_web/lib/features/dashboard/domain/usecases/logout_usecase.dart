import 'package:dartz/dartz.dart';
import 'package:purple_web/lib.dart';

import '../../dashboard.dart';

abstract class ILogoutUsecase {
  Future<Either<Failure, bool>> call();
}

class LogoutUsecase implements ILogoutUsecase {
  final ISessionRepository repository;
  const LogoutUsecase({required this.repository});

  @override
  Future<Either<Failure, bool>> call() async {
    return repository.logout();
  }
}
