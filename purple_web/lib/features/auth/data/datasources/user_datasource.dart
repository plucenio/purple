import '../../../../lib.dart';

abstract class IUserDatasource {
  Future<String> login({required LoginModel user});

  Future<bool> createAccount({required UserModel user});
}

class UserDatasource implements IUserDatasource {
  final IHttpClient httpClient;
  const UserDatasource({required this.httpClient});

  @override
  Future<String> login({required LoginModel user}) async {
    final response = await httpClient.post(
      '/log-in',
      queryParameters: user.toJson(),
    );
    return response.data['result']['sessionToken'];
  }

  @override
  Future<bool> createAccount({required UserModel user}) async {
    final response = await httpClient.post(
      '/sign-up',
      queryParameters: user.toJson(),
    );
    return response.data['result'];
  }
}
