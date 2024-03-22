import 'package:localstorage/localstorage.dart';

abstract class ISaveSessionTokenUsecase {
  void call({required String sessionToken});
}

class SaveSessionTokenUsecase implements ISaveSessionTokenUsecase {
  @override
  void call({required String sessionToken}) async {
    final LocalStorage storage = LocalStorage('session_token');
    await storage.setItem('value', sessionToken);
  }
}
