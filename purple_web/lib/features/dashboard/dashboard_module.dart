import 'package:flutter_modular/flutter_modular.dart';

import '../../lib.dart';
import 'dashboard.dart';

class DashboardModule extends Module {
  static const String root = '/';

  @override
  List<Module> get imports => [BaseModule()];

  @override
  void binds(final i) {
    i.add<IDashboardDatasource>(() => DashboardDatasource(
          httpClient: i.get<IHttpClient>(),
        ));
    i.add<IDashboardRepository>(() => DashboardRespository(
          datasource: i.get<IDashboardDatasource>(),
        ));
    i.add<ILogoutUsecase>(
      () => LogoutUsecase(
        repository: i.get<IDashboardRepository>(),
      ),
    );
    i.add<DashboardViewmodel>(
      () => DashboardViewmodel(
        usecase: i.get<ILogoutUsecase>(),
      ),
    );
  }

  @override
  void routes(final r) {
    r.child('/', child: (final _) => const DashboardPage());
  }
}
