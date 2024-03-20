import '../../lib.dart';

abstract class IGetSessionTokenUsecase {
  String call();
}

class GetSessionTokenUsecase implements IGetSessionTokenUsecase {
  @override
  String call() {
    return sessionToken;
  }
}
