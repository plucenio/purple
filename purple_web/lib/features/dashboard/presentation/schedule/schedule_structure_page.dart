import 'package:flutter/material.dart';

import '../../../../lib.dart';
import '../../dashboard.dart';

class ScheduleStructuresPage extends StatefulWidget {
  const ScheduleStructuresPage({super.key});

  @override
  State<ScheduleStructuresPage> createState() => _ScheduleStructuresPageState();
}

class _ScheduleStructuresPageState
    extends ViewState<ScheduleStructuresPage, ScheduleStructureViewmodel> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder(
      viewModel: viewModel,
      builder: (context, state) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Flexible(
              flex: 1,
              child: Row(children: [
                CustomSelectedButton(
                  isSelected: (state is ScheduleState),
                  child: Text(
                    'Agenda',
                    style: context.theme.textTheme.bodyMedium,
                  ),
                  onPressed: () {
                    viewModel.changeState(
                        state: ScheduleStructureStateEnum.schedule);
                  },
                ),
                const SizedBox(width: 10),
                CustomSelectedButton(
                  isSelected: (state is AddNewScheduleStructureState),
                  child: Text(
                    'Novo agendamento',
                    style: context.theme.textTheme.bodyMedium,
                  ),
                  onPressed: () {
                    viewModel.changeState(
                        state:
                            ScheduleStructureStateEnum.addNewScheduleStructure);
                  },
                ),
              ]),
            ),
          ),
          Flexible(
            flex: 9,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child:
                  (state is ScheduleState) ? const SchedulePage() : Container(),
            ),
          ),
        ],
      ),
    );
  }
}
