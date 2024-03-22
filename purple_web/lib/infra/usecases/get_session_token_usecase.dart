import 'package:localstorage/localstorage.dart';

abstract class IGetSessionTokenUsecase {
  Future<String> call();
}

class GetSessionTokenUsecase implements IGetSessionTokenUsecase {
  @override
  Future<String> call() async {
    final LocalStorage storage = LocalStorage('session_token');
    if (!await storage.ready) {
      return '';
    }
    return (await storage.getItem('value')) ?? '';
  }
}
