import '../../../../lib.dart';

abstract class IUserRepository {
  // API methods
  Future<List<User>> getUser();
}
