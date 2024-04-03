import 'package:flutter/material.dart';

import '../../../../lib.dart';
import '../../dashboard.dart';

class NewCustomerPage extends StatefulWidget {
  const NewCustomerPage({super.key});

  @override
  State<NewCustomerPage> createState() => _NewCustomerPageState();
}

class _NewCustomerPageState
    extends ViewState<NewCustomerPage, NewCustomerViewmodel> {
  final _formKey = GlobalKey<FormState>();
  final _cpfController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelConsumer(
      viewModel: viewModel,
      listener: (context, state) {
        if (state is SuccessCustomersState) {
          Nav.pushReplacementNamed(BaseModule.root);
          return;
        }
        if (state is ErrorCustomersState) {
          if (state.errorMessage.isNotEmpty) {
            context.showSnackBar(ErrorSnackBar(
              content: Text(state.errorMessage),
            ));
          }
        }
      },
      builder: (context, state) => (state is LoadingCustomersState)
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
                      labelText: 'Nome',
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
                  TextFormField(
                    controller: _cpfController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.account_box),
                      labelText: 'CPF',
                      labelStyle: TextStyle(
                        color: context.theme.primaryColor,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: context.theme.primaryColor),
                      ),
                    ),
                    validator: (cpf) {
                      if (cpf == null || cpf.isEmpty) {
                        return 'Cadastre o CPF';
                      }
                      if (cpf.length < 11) {
                        return 'CPF inválido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.email),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: context.theme.primaryColor,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: context.theme.primaryColor),
                      ),
                    ),
                    validator: (String? value) {
                      return !EmailValidatorAdapter.validate(value ?? '')
                          ? 'Email inválido'
                          : null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _phoneNumberController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.phone),
                      labelText: 'Telefone',
                      labelStyle: TextStyle(
                        color: context.theme.primaryColor,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: context.theme.primaryColor),
                      ),
                    ),
                    validator: (phone) {
                      if (phone == null || phone.isEmpty) {
                        return 'Cadastre um telefone';
                      }
                      if (phone.length < 8) {
                        return 'Telefone inválido';
                      }
                      return null;
                    },
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
