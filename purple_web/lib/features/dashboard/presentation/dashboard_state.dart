import '../../../lib.dart';
import '../dashboard.dart';

class DashboardState extends ViewModelState {
  const DashboardState();
}

class LoadingDashboardState extends DashboardState {
  const LoadingDashboardState();
}

class SuccessDashboardState extends DashboardState {
  final Studio studio;
  const SuccessDashboardState({required this.studio});
}

class InexistentStudioState extends DashboardState {
  const InexistentStudioState();
}

class LogoutState extends DashboardState {
  const LogoutState();
}

class ErrorDashboardState extends DashboardState {
  final String errorMessage;
  const ErrorDashboardState({required this.errorMessage});
}
