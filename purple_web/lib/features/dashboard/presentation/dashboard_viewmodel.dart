import '../../../lib.dart';
import '../dashboard.dart';

class DashboardViewmodel extends ViewModel<DashboardState> {
  final ILogoutUsecase usecase;
  DashboardViewmodel({required this.usecase}) : super(const DashboardState());

  void logout() async {
    final newState = (await usecase.call()).fold(
      (l) => ErrorDashboardState(errorMessage: l.message),
      (r) => const LogoutState(),
    );
    emit(newState);
  }
}
