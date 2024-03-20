import '../../../lib.dart';

class DashboardState extends ViewModelState {
  const DashboardState();
}

class LoadingDashboardState extends DashboardState {
  const LoadingDashboardState();
}

class SuccessDashboardState extends DashboardState {
  const SuccessDashboardState();
}

class ErrorDashboardState extends DashboardState {
  final String errorMessage;
  const ErrorDashboardState({required this.errorMessage});
}
