import 'package:dio/dio.dart';

import '../../../../lib.dart';

abstract class IUserDatasource {
  Future<UserModel> login({required UserModel user});
}

class UserDatasource implements IUserDatasource {
  final IHttpClient httpClient;
  const UserDatasource({required this.httpClient});

  @override
  Future<UserModel> login({required UserModel user}) async {
    final response = await httpClient.post('/log-in',
        queryParameters: user.toJson(),
        options: Options(headers: {
          'X-Parse-Application-Id': APP_ID,
          'X-Parse-REST-API-Key': API_KEY
        }));
    return UserModel.fromJson(response.data['result']);
  }
}
