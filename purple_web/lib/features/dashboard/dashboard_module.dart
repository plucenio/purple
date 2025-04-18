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
    i.add<IGetStudioUsecase>(
      () => GetStudioUsecase(
        repository: i.get<IDashboardRepository>(),
      ),
    );
    i.add<ICreateStudioUsecase>(
      () => CreateStudioUsecase(
        repository: i.get<IDashboardRepository>(),
      ),
    );
    i.add<ILinkStudioUsecase>(
      () => LinkStudioUsecase(
        repository: i.get<IDashboardRepository>(),
      ),
    );
    i.add<DashboardViewmodel>(
      () => DashboardViewmodel(
        logoutUsecase: i.get<ILogoutUsecase>(),
        getStudioUsecase: i.get<IGetStudioUsecase>(),
        createStudioUsecase: i.get<ICreateStudioUsecase>(),
        linkStudioUsecase: i.get<ILinkStudioUsecase>(),
      ),
    );
    i.add<CustomerViewmodel>(
      () => CustomerViewmodel(),
    );
    i.add<NewCustomerViewmodel>(
      () => NewCustomerViewmodel(),
    );
    i.add<EvaluationsViewmodel>(
      () => EvaluationsViewmodel(),
    );
    i.add<NewEvaluationViewmodel>(
      () => NewEvaluationViewmodel(),
    );
    i.add<ScheduleStructureViewmodel>(
      () => ScheduleStructureViewmodel(),
    );
  }

  @override
  void routes(final r) {
    r.child('/', child: (final _) => const DashboardPage());
  }
}
