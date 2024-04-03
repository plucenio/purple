import '../../../../lib.dart';

class NewEvaluationState extends ViewModelState {
  const NewEvaluationState();
}

class LoadingEvaluationsState extends NewEvaluationState {
  const LoadingEvaluationsState();
}

class SuccessEvaluationsState extends NewEvaluationState {
  const SuccessEvaluationsState();
}

class ErrorEvaluationsState extends NewEvaluationState {
  final String errorMessage;
  const ErrorEvaluationsState({required this.errorMessage});
}
