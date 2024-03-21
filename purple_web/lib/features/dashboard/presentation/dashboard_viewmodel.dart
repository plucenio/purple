import '../../../lib.dart';
import '../dashboard.dart';

class DashboardViewmodel extends ViewModel<DashboardState> {
  final ILogoutUsecase logoutUsecase;
  final IGetStudioUsecase getStudioUsecase;
  DashboardViewmodel({
    required this.getStudioUsecase,
    required this.logoutUsecase,
  }) : super(const DashboardState());

  void getStudio({required String studioId}) async {
    final newState = (await getStudioUsecase.call(studioId: studioId)).fold(
      (l) => ErrorDashboardState(errorMessage: l.message),
      (r) => SuccessDashboardState(studio: r),
    );
    emit(newState);
  }

  void logout() async {
    final newState = (await logoutUsecase.call()).fold(
      (l) => ErrorDashboardState(errorMessage: l.message),
      (r) => const LogoutState(),
    );
    emit(newState);
  }
}
