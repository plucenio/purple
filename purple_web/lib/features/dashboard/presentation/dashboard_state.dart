import '../../../lib.dart';
import '../dashboard.dart';

enum DashboardSection {
  customers,
  schedule,
}

class DashboardState extends ViewModelState {
  const DashboardState();
}

abstract class LoggedDashboardState extends DashboardState {
  final Studio studio;
  const LoggedDashboardState({
    required this.studio,
  });
}

class LoadingDashboardState extends DashboardState {
  const LoadingDashboardState();
}

class DashboardCustomersState extends LoggedDashboardState {
  const DashboardCustomersState({
    required super.studio,
  });
}

class DashboardScheduleState extends LoggedDashboardState {
  const DashboardScheduleState({
    required super.studio,
  });
}

class InexistentStudioState extends DashboardState {
  const InexistentStudioState();
}

class NewStudioCreatedState extends LoggedDashboardState {
  const NewStudioCreatedState({required super.studio});
}

class LogoutState extends DashboardState {
  const LogoutState();
}

class ErrorDashboardState extends DashboardState {
  final String errorMessage;
  const ErrorDashboardState({required this.errorMessage});
}
