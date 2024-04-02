import '../../../lib.dart';
import '../dashboard.dart';

class DashboardViewmodel extends ViewModel<DashboardState> {
  final ILogoutUsecase logoutUsecase;
  final IGetStudioUsecase getStudioUsecase;
  final ICreateStudioUsecase createStudioUsecase;
  final ILinkStudioUsecase linkStudioUsecase;
  DashboardViewmodel({
    required this.getStudioUsecase,
    required this.logoutUsecase,
    required this.createStudioUsecase,
    required this.linkStudioUsecase,
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
            ? DashboardCustomersState(
                studio: studio,
              )
            : const InexistentStudioState();
      },
    );
    emit(newState);
  }

  void changeSection(DashboardSection section) {
    if (section == DashboardSection.customers) {
      emit(DashboardCustomersState(
        studio: (state as LoggedDashboardState).studio,
      ));
      return;
    }
    if (section == DashboardSection.schedule) {
      emit(DashboardScheduleState(
        studio: (state as LoggedDashboardState).studio,
      ));
      return;
    }
  }

  void logout() async {
    emit(const LoadingDashboardState());
    final newState = (await logoutUsecase.call()).fold(
      (l) => ErrorDashboardState(errorMessage: l.message),
      (r) => const LogoutState(),
    );
    emit(newState);
  }

  void createStudio({required Studio studio}) async {
    emit(const LoadingDashboardState());
    final newState = (await createStudioUsecase.call(studio: studio)).fold(
      (l) => ErrorDashboardState(errorMessage: l.message),
      (r) => r == null
          ? const InexistentStudioState()
          : NewStudioCreatedState(studio: r),
    );
    emit(newState);
  }

  void linkStudio({required String studioId}) async {
    emit(const LoadingDashboardState());
    final newState = (await linkStudioUsecase.call(studioId: studioId)).fold(
      (l) => ErrorDashboardState(errorMessage: l.message),
      (r) => r == null
          ? const InexistentStudioState()
          : DashboardCustomersState(
              studio: r,
            ),
    );
    emit(newState);
  }
}
