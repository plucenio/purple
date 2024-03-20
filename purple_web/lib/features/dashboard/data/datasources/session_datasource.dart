import '../../../../lib.dart';

abstract class ISessionDatasource {
  Future<bool> logout();
}

class SessionDatasource implements ISessionDatasource {
  final IHttpClient httpClient;
  const SessionDatasource({required this.httpClient});

  @override
  Future<bool> logout() async {
    await httpClient.post(
      '/log-out',
    );
    return true;
  }
}
