import 'package:dartz/dartz.dart';
import 'package:purple_web/lib.dart';

abstract class ILoginUsecase {
  Future<Either<Failure, User>> login({required User user});
}

class LoginUsecase implements ILoginUsecase {
  final IUserRepository repository;
  const LoginUsecase({required this.repository});

  @override
  Future<Either<Failure, User>> login({required User user}) async {
    return repository.login(user: user);
  }
}
