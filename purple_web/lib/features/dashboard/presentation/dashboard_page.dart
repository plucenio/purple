import 'package:flutter/material.dart';
import 'package:purple_web/features/dashboard/presentation/studio/inexistent_studio_page.dart';
import 'package:purple_web/lib.dart';

import '../dashboard.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ViewState<DashboardPage, DashboardViewmodel> {
  @override
  Widget build(BuildContext context) {
    return ViewModelConsumer(
      viewModel: viewModel,
      listener: (context, state) async {
        if (state is LogoutState) {
          await Nav.pushNamedAndRemoveUntil(
              BaseModule.root, (p0) => p0.isFirst);
          return;
        }
        if (state is NewStudioCreatedState) {
          if (state.studio.objectId != null) {
            viewModel.linkStudio(studioId: state.studio.objectId!);
          }
        }
        if (state is ErrorDashboardState) {
          if (state.errorMessage.isNotEmpty) {
            context.showSnackBar(ErrorSnackBar(
              content: Text(state.errorMessage),
            ));
          }
        }
      },
      builder: (context, state) => Scaffold(
        appBar: PurpleAppBar(
          actions: [
            Text(
              (state is LoggedDashboardState) ? state.studio.name : '',
              style: context.theme.textTheme.bodyMedium!.copyWith(
                color: AppColor.INVERTED_TEXT_COLOR,
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () async {
                viewModel.logout();
              },
              icon: const Icon(
                Icons.logout,
                color: AppColor.INVERTED_TEXT_COLOR,
              ),
            )
          ],
        ),
        body: (state is LoadingDashboardState)
            ? const Center(child: CircularProgressIndicator())
            : (state is InexistentStudioState)
                ? InexistentStudioPage(
                    viewModel: viewModel,
                  )
                : DashboardStructure(
                    actions: [
                      ActionMenu(
                          text: 'Pacientes',
                          icon: const Icon(Icons.people),
                          onPressed: () {
                            viewModel.changeSection(DashboardSection.customers);
                          }),
                      ActionMenu(
                          text: 'Evoluções',
                          icon: const Icon(Icons.file_open),
                          onPressed: () {
                            viewModel.changeSection(DashboardSection.customers);
                          }),
                      ActionMenu(
                          text: 'Agenda',
                          icon: const Icon(Icons.calendar_month),
                          onPressed: () {
                            viewModel.changeSection(DashboardSection.schedule);
                          }),
                      //It will be implemented in a second version.
                      //ActionMenu(
                      //    text: 'Financeiro',
                      //    icon: const Icon(Icons.monetization_on),
                      //    onPressed: () {
                      //      viewModel.changeSection(DashboardSection.customers);
                      //    }),
                      ActionMenu(
                          text: 'Configurações',
                          icon: const Icon(Icons.settings),
                          onPressed: () {
                            viewModel.changeSection(DashboardSection.customers);
                          }),
                    ],
                    child: (state is DashboardCustomersState)
                        ? const CustomersPage()
                        : const SchedulePage(),
                  ),
      ),
    );
  }
}
