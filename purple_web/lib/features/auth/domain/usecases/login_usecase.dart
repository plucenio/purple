import 'package:dartz/dartz.dart';
import '../../../../lib.dart';
import '../../auth.dart';

abstract class ILoginUsecase {
  Future<Either<Failure, String>> call({required Login login});
}

class LoginUsecase implements ILoginUsecase {
  final IUserRepository repository;
  const LoginUsecase({required this.repository});

  @override
  Future<Either<Failure, String>> call({required Login login}) async {
    return repository.login(login: login);
  }
}
