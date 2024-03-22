import 'package:localstorage/localstorage.dart';

abstract class ISaveSessionTokenUsecase {
  void call({required String sessionToken});
}

class SaveSessionTokenUsecase implements ISaveSessionTokenUsecase {
  @override
  void call({required String sessionToken}) async {
    final LocalStorage storage = LocalStorage('session_token');
    if (!await storage.ready) {
      return;
    }
    await storage.clear();
    await storage.setItem('value', sessionToken);
  }
}
