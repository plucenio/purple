import 'package:flutter/material.dart';
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
        if (state is ErrorDashboardState) {
          if (state.errorMessage.isNotEmpty) {
            context.showSnackBar(ErrorSnackBar(
              content: Text(state.errorMessage),
            ));
          }
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: const Text(APP_NAME),
          actions: [
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
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        color: context.theme.colorScheme.primaryContainer,
                        child: Column(
                          children: [
                            ButtonMenu(
                              text: 'Pacientes',
                              onPressed: () {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ButtonMenu(
                              text: 'Evoluções',
                              onPressed: () {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ButtonMenu(
                              text: 'Agenda',
                              onPressed: () {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ButtonMenu(
                              text: 'Financeiro',
                              onPressed: () {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ButtonMenu(
                              text: 'Configurações',
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          color: context.theme.colorScheme.primaryContainer,
                          child: const Center(
                            child: Text('logged'),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        color: context.theme.colorScheme.primaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 60.0,
              color: Colors.purple.shade200,
            )
          ],
        ),
      ),
    );
  }
}
