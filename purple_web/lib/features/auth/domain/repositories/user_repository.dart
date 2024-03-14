import '../../../../lib.dart';

abstract class IUserRepository {
  // API methods
  Future<DataState<List<User>>> getUser();
}
