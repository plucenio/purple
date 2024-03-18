import 'package:flutter_modular/flutter_modular.dart';

import '../../lib.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [BaseModule()];

  @override
  void binds(final i) {
    i.add<IUserDatasource>(() => UserDatasource(
          httpClient: i.get<IHttpClient>(),
        ));
    i.add<IUserRepository>(() => UserRespository(
          datasource: i.get<IUserDatasource>(),
        ));
    i.add<ILoginUsecase>(
      () => LoginUsecase(
        repository: i.get<IUserRepository>(),
      ),
    );
    i.add<LoginViewmodel>(
      () => LoginViewmodel(
        usecase: i.get<ILoginUsecase>(),
      ),
    );
  }

  @override
  void routes(final r) {
    r.child('/', child: (final _) => const LoginPage());
  }
}
