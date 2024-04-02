import 'package:flutter/material.dart';

import '../../../../lib.dart';
import '../../dashboard.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({super.key});

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends ViewState<CustomersPage, CustomersViewmodel> {
  final _formKey = GlobalKey<FormState>();
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
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                AppColor.PRIMARY.withOpacity(0.3),
                AppColor.SECONDARY.withOpacity(0.3),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ViewModelConsumer(
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              icon: const Icon(Icons.person),
                              labelText: 'Nome',
                              labelStyle: TextStyle(
                                color: context.theme.primaryColor,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: context.theme.primaryColor),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _emailController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              icon: const Icon(Icons.email),
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: context.theme.primaryColor,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: context.theme.primaryColor),
                              ),
                            ),
                            validator: (String? value) {
                              return !EmailValidatorAdapter.validate(
                                      value ?? '')
                                  ? 'Email inválido'
                                  : null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _phoneNumberController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              icon: const Icon(Icons.phone),
                              labelText: 'Telefone',
                              labelStyle: TextStyle(
                                color: context.theme.primaryColor,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: context.theme.primaryColor),
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
                            child: const Text('Criar conta'),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () async {
                              Nav.pop();
                            },
                            child: const Text('Voltar'),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
