import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../lib.dart';
part 'user_datasource.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class UserDatasource {
  factory UserDatasource(Dio dio) = _UserDatasource;

  @POST('/list-users')
  Future<HttpResponse<List<UserModel>>> getUsers({
    @Header('X-Parse-Application-Id') String? appId,
    @Header('X-Parse-REST-API-Key') String? apiKey,
  });
}
