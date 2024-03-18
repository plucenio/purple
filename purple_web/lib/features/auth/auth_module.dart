import 'package:flutter_modular/flutter_modular.dart';

import '../../lib.dart';

class AuthModule extends Module {
  @override
  void routes(final r) {
    r.child('/',
        child: (final _) => const LoginPage(
              title: APP_NAME,
            ));
  }
}
