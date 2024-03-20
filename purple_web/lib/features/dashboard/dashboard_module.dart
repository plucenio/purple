import 'package:flutter_modular/flutter_modular.dart';

import '../../lib.dart';
import 'dashboard.dart';

class DashboardModule extends Module {
  static const String root = '/';

  @override
  List<Module> get imports => [BaseModule()];

  @override
  void binds(final i) {
    i.add<ISessionDatasource>(() => SessionDatasource(
          httpClient: i.get<IHttpClient>(),
        ));
    i.add<ISessionRepository>(() => SessionRespository(
          datasource: i.get<ISessionDatasource>(),
        ));
    i.add<ILogoutUsecase>(
      () => LogoutUsecase(
        repository: i.get<ISessionRepository>(),
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
