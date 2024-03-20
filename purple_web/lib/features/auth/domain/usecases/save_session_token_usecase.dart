import '../../../../lib.dart';

abstract class ISaveSessionTokenUsecase {
  void call({required String st});
}

class SaveSessionTokenUsecase implements ISaveSessionTokenUsecase {
  @override
  void call({required String st}) async {
    sessionToken = st;
  }
}
