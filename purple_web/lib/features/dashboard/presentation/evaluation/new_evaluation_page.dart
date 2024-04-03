import 'package:flutter/material.dart';

import '../../../../lib.dart';
import '../../dashboard.dart';

class NewEvaluationPage extends StatefulWidget {
  const NewEvaluationPage({super.key});

  @override
  State<NewEvaluationPage> createState() => _NewEvaluationPageState();
}

class _NewEvaluationPageState
    extends ViewState<NewEvaluationPage, NewEvaluationViewmodel> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelConsumer(
      viewModel: viewModel,
      listener: (context, state) {
        if (state is SuccessEvaluationsState) {
          Nav.pushReplacementNamed(BaseModule.root);
          return;
        }
        if (state is ErrorEvaluationsState) {
          if (state.errorMessage.isNotEmpty) {
            context.showSnackBar(ErrorSnackBar(
              content: Text(state.errorMessage),
            ));
          }
        }
      },
      builder: (context, state) => (state is LoadingEvaluationsState)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _nameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.person),
                      labelText: 'Paciente',
                      labelStyle: TextStyle(
                        color: context.theme.primaryColor,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: context.theme.primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // viewModel.createAccount(
                        //   user: User(
                        //     name: _nameController.text,
                        //     username: _emailController.text,
                        //     password: _passwordController.text,
                        //     confirmedPassword:
                        //         _confirmPasswordController.text,
                        //     email: _emailController.text,
                        //     phone: _phoneNumberController.text,
                        //   ),
                        // );
                      }
                    },
                    child: const Text('Salvar'),
                  ),
                ],
              ),
            ),
    );
  }
}
