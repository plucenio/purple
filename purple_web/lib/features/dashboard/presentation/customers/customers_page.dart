import 'package:flutter/material.dart';

import '../../../../lib.dart';
import '../../dashboard.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({super.key});

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends ViewState<CustomersPage, CustomerViewmodel> {
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
                CustomSelectedButton(
                  isSelected: (state is ListCustomersState),
                  child: Text(
                    'Listar todos',
                    style: context.theme.textTheme.bodyMedium,
                  ),
                  onPressed: () {
                    viewModel.changeState(
                        state: CustomersStateEnum.listCustomers);
                  },
                ),
                const SizedBox(width: 10),
                CustomSelectedButton(
                  isSelected: (state is AddNewCustomersState),
                  child: Text(
                    'Novo',
                    style: context.theme.textTheme.bodyMedium,
                  ),
                  onPressed: () {
                    viewModel.changeState(
                        state: CustomersStateEnum.addNewCustomer);
                  },
                ),
              ]),
            ),
            Flexible(
              flex: 9,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: (state is ListCustomersState)
                    ? Container()
                    : const NewCustomerPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
