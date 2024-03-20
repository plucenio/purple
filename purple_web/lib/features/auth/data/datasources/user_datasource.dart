import '../../../../lib.dart';
import '../../auth.dart';

abstract class IUserDatasource {
  Future<bool> createAccount({required UserModel user});

  Future<String> login({required LoginModel user});
}

class UserDatasource implements IUserDatasource {
  final IHttpClient httpClient;
  const UserDatasource({required this.httpClient});

  @override
  Future<bool> createAccount({required UserModel user}) async {
    final response = await httpClient.post(
      '/sign-up',
      queryParameters: user.toJson(),
    );
    return response.data['result'];
  }

  @override
  Future<String> login({required LoginModel user}) async {
    final response = await httpClient.post(
      '/log-in',
      queryParameters: user.toJson(),
    );
    sessionToken = response.data['result']['sessionToken'];
    return response.data['result']['sessionToken'];
  }
}
