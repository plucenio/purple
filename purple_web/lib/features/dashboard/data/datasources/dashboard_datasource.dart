import 'package:purple_web/features/dashboard/dashboard.dart';

import '../../../../lib.dart';

abstract class IDashboardDatasource {
  Future<bool> logout();

  Future<StudioModel?> getStudio();

  Future<StudioModel?> createStudio({required StudioModel studio});
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
  Future<StudioModel?> getStudio() async {
    final response = await httpClient.post(
      '/get-studio',
    );
    return response.data['result'] == null
        ? null
        : StudioModel.fromJson(response.data['result']);
  }

  @override
  Future<StudioModel?> createStudio({required StudioModel studio}) async {
    final response = await httpClient.post(
      '/create-studio',
      queryParameters: studio.toJson(),
    );
    return response.data['result'] == null
        ? null
        : StudioModel.fromJson(response.data['result']);
  }
}
