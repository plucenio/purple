import '../../../../lib.dart';

abstract class IDashboardDatasource {
  Future<bool> logout();
}

class DashboardDatasource implements IDashboardDatasource {
  final IHttpClient httpClient;
  const DashboardDatasource({required this.httpClient});

  @override
  Future<bool> logout() async {
    await httpClient.post(
      '/log-out',
    );
    return true;
  }
}
