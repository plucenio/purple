import 'package:flutter_test/flutter_test.dart';
import 'package:purple_web/lib.dart';
import 'package:dio/dio.dart';

void main() {
  late UserDatasource datasource;
  late HttpClient client;
  late Dio dio;

  setUp(() {
    dio = Dio(
      BaseOptions(baseUrl: BASE_URL),
    );
    client = HttpClient(dio: dio);
    datasource = UserDatasource(httpClient: client);
  });

  test('getUsers should return http response with list of user model',
      () async {
    // arrange
    //final expectedUsers = <UserModel>[];
    //final r = Response<dynamic>();
    //final httpResponse = HttpResponse(expectedUsers, r);
    //when(dio.get<List<dynamic>>(any)).thenAnswer((_) async => httpResponse);

    // act
    final result = await datasource.login(
        user: const LoginModel(username: 'email', password: 'password'));

    // assert
    expect(result, null);
  });
}
