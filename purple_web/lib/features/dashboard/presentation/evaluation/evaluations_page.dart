import 'package:flutter/material.dart';

import '../../../../lib.dart';
import '../../dashboard.dart';

class EvaluationsPage extends StatefulWidget {
  const EvaluationsPage({super.key});

  @override
  State<EvaluationsPage> createState() => _EvaluationsPageState();
}

class _EvaluationsPageState
    extends ViewState<EvaluationsPage, EvaluationsViewmodel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ViewModelBuilder(
        viewModel: viewModel,
        builder: (context, state) => Column(
          children: [
            Flexible(
              flex: 1,
              child: Row(children: [
                CustomButton(
                  color: (state is ListEvaluationsState)
                      ? AppColor.SECONDARY
                      : null,
                  child: Text(
                    'Listar todas',
                    style: context.theme.textTheme.bodyMedium,
                  ),
                  onPressed: () {
                    viewModel.changeState(
                        state: EvaluationsStateEnum.listEvaluations);
                  },
                ),
                const SizedBox(width: 10),
                CustomButton(
                  color: (state is AddNewEvaluationState)
                      ? AppColor.SECONDARY
                      : null,
                  child: Text(
                    'Nova avaliação',
                    style: context.theme.textTheme.bodyMedium,
                  ),
                  onPressed: () {
                    viewModel.changeState(
                        state: EvaluationsStateEnum.addNewEvaluation);
                  },
                ),
              ]),
            ),
            Flexible(
              flex: 9,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: (state is ListEvaluationsState)
                    ? Container()
                    : const NewEvaluationPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
