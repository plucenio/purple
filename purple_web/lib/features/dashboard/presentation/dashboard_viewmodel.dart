import '../../../lib.dart';

class DashboardViewmodel extends ViewModel<DashboardState> {
  final ILogoutUsecase usecase;
  DashboardViewmodel({required this.usecase}) : super(const DashboardState());

  void logout({required String sessionToken}) async {}
}
