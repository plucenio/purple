import '../../../../lib.dart';

enum EvaluationsStateEnum {
  addNewEvaluation,
  listEvaluations,
}

class EvaluationsState extends ViewModelState {
  const EvaluationsState();
}

class AddNewEvaluationState extends EvaluationsState {
  const AddNewEvaluationState();
}

class ListEvaluationsState extends EvaluationsState {
  const ListEvaluationsState();
}
