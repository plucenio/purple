import 'package:dio/dio.dart';

import '../../../../lib.dart';

abstract class IUserDatasource {
  Future<List<UserModel>> getUsers();
}

class UserDatasource implements IUserDatasource {
  final IHttpClient httpClient;
  const UserDatasource({required this.httpClient});

  @override
  Future<List<UserModel>> getUsers() async {
    final response = await httpClient.post('/list-users',
        options: Options(headers: {
          'X-Parse-Application-Id': APP_ID,
          'X-Parse-REST-API-Key': API_KEY
        }));
    return List<UserModel>.from(
            response.data['result'].map((x) => UserModel.fromJson(x)))
        .cast<UserModel>();
  }
}
