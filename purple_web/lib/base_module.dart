import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'features/auth/auth.dart';
import 'features/dashboard/dashboard.dart';
import 'lib.dart';

class BaseModule extends Module {
  static const String root = '/';
  static const String dashboard = '/dashboard';

  @override
  void binds(final i) {
    i.add<IHttpClient>(
      () => HttpClient(
        dio: Dio(
          BaseOptions(
            baseUrl: BASE_URL,
            headers: {
              'Content-Type': 'application/json',
              'X-Parse-Application-Id': APP_ID,
              'X-Parse-REST-API-Key': API_KEY,
            },
          ),
        ),
      ),
    );
    i.addSingleton<IAdaptativeSizer>(
      AdaptativeSizer.instance,
    );
  }

  @override
  void routes(final r) {
    r.module(
      root,
      module: AuthModule(),
    );
    r.module(
      dashboard,
      module: DashboardModule(),
    );
  }
}
