import '../../../lib.dart';
import '../dashboard.dart';

class DashboardViewmodel extends ViewModel<DashboardState> {
  final ILogoutUsecase logoutUsecase;
  final IGetStudioUsecase getStudioUsecase;
  DashboardViewmodel({
    required this.getStudioUsecase,
    required this.logoutUsecase,
  }) : super(const DashboardState());

  @override
  void initViewModel() {
    super.initViewModel();
    getStudio();
  }

  void getStudio() async {
    emit(const LoadingDashboardState());
    final newState = (await getStudioUsecase.call()).fold(
      (l) => ErrorDashboardState(errorMessage: l.message),
      (studio) {
        return studio != null
            ? SuccessDashboardState(studio: studio)
            : const InexistentStudioState();
      },
    );
    emit(newState);
  }

  void logout() async {
    emit(const LoadingDashboardState());
    final newState = (await logoutUsecase.call()).fold(
      (l) => ErrorDashboardState(errorMessage: l.message),
      (r) => const LogoutState(),
    );
    emit(newState);
  }
}
