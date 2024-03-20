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
                color: Colors.black,
              ),
            )
          ],
        ),
        body: Row(
          children: [
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    color: Colors.teal,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    color: Colors.teal,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    color: Colors.teal,
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 5,
              child: Container(
                color: context.theme.primaryColor,
                child: const Center(
                  child: Text('logged'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
