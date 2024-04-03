import '../../../../lib.dart';

enum ScheduleStructureStateEnum {
  addNewScheduleStructure,
  schedule,
}

abstract class ScheduleStructureState extends ViewModelState {
  const ScheduleStructureState();
}

class AddNewScheduleStructureState extends ScheduleStructureState {
  const AddNewScheduleStructureState();
}

class ScheduleState extends ScheduleStructureState {
  const ScheduleState();
}
