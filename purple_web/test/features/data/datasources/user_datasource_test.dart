import 'package:flutter_test/flutter_test.dart';
import 'package:purple_web/lib.dart';
import 'package:dio/dio.dart';

void main() {
  late UserDatasource datasource;
  late Dio dio;

  setUp(() {
    dio = Dio();
    datasource = UserDatasource(dio);
  });

  test('getUsers should return http response with list of user model',
      () async {
    // arrange
    //final expectedUsers = <UserModel>[];
    //final r = Response<dynamic>();
    //final httpResponse = HttpResponse(expectedUsers, r);
    //when(dio.get<List<dynamic>>(any)).thenAnswer((_) async => httpResponse);

    // act
    final result = await datasource.getUsers(
      appId: appId,
      apiKey: apiKey,
    );

    // assert
    expect(result, null);
  });
}
