import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:purple_web/lib.dart';

import '../dashboard.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ViewState<DashboardPage, DashboardViewmodel> {
  final _formKey = GlobalKey<FormState>();
  final _documentController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  final _codeController = TextEditingController();

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
        body: (state is LoadingDashboardState)
            ? const Center(child: CircularProgressIndicator())
            : (state is InexistentStudioState)
                ? DashboardStructure(
                    showMenu: false,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  TextFormField(
                                    controller: _documentController,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                      icon: const Icon(Icons.account_box),
                                      labelText: 'CNPJ/CPF',
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
                                    controller: _nameController,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                      icon: const Icon(Icons.business),
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
                                      return !EmailValidator.validate(
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
                                  CustomButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        viewModel.createStudio(
                                            studio: Studio(
                                          name: _nameController.text,
                                          cnpj: _documentController.text,
                                          email: _emailController.text,
                                          phone: _phoneNumberController.text,
                                        ));
                                      }
                                    },
                                    child: Text(
                                      'Criar um novo Studio',
                                      style: context.theme.textTheme.bodyLarge!
                                          .copyWith(
                                        color: AppColor.INVERTED_TEXT_COLOR,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const VerticalDivider(
                            thickness: 1,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextFormField(
                                  controller: _codeController,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                    icon: const Icon(Icons.code),
                                    labelText: 'Código',
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
                                CustomButton(
                                  onPressed: () {
                                    if (_codeController.text.isNotEmpty) {
                                      viewModel.linkStudio(
                                        studioId: _codeController.text,
                                      );
                                    }
                                  },
                                  child: Text(
                                    'Entrar com um Studio existente',
                                    style: context.theme.textTheme.bodyLarge!
                                        .copyWith(
                                      color: AppColor.INVERTED_TEXT_COLOR,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const DashboardStructure(
                    child: Center(
                      child: Text('logged'),
                    ),
                  ),
      ),
    );
  }
}
