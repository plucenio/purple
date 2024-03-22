import 'package:dartz/dartz.dart';
import '../../../../lib.dart';
import '../../auth.dart';

abstract class ICreateAccountUsecase {
  Future<Either<Failure, bool>> call({required User user});
}

class CreateAccountUsecase implements ICreateAccountUsecase {
  final IUserRepository repository;
  const CreateAccountUsecase({required this.repository});

  @override
  Future<Either<Failure, bool>> call({required User user}) async {
    return repository.createAccount(user: user);
  }
}
