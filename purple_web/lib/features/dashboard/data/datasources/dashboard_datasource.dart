import 'package:purple_web/features/dashboard/dashboard.dart';

import '../../../../lib.dart';

abstract class IDashboardDatasource {
  Future<bool> logout();

  Future<StudioModel> getStudio({required String studioId});
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

  @override
  Future<StudioModel> getStudio({required String studioId}) async {
    final response = await httpClient.post(
      '/get-studio',
    );
    return StudioModel.fromJson(response.data['result']);
  }
}
