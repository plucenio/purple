import 'package:flutter/material.dart';

import '../../../../lib.dart';
import '../../dashboard.dart';

class InexistentStudioPage extends StatefulWidget {
  final DashboardViewmodel viewModel;

  const InexistentStudioPage({
    super.key,
    required this.viewModel,
  });

  @override
  State<InexistentStudioPage> createState() => _InexistentStudioPageState();
}

class _InexistentStudioPageState extends State<InexistentStudioPage> {
  final _formKey = GlobalKey<FormState>();
  final _documentController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DashboardStructure(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 100),
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.account_box),
                        labelText: 'CNPJ/CPF',
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
                      controller: _nameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.business),
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
                    CustomButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          widget.viewModel.createStudio(
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
                        style: context.theme.textTheme.bodyLarge!.copyWith(
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.code),
                      labelText: 'Código',
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
                  CustomButton(
                    onPressed: () {
                      if (_codeController.text.isNotEmpty) {
                        widget.viewModel.linkStudio(
                          studioId: _codeController.text,
                        );
                      }
                    },
                    child: Text(
                      'Entrar com um Studio existente',
                      style: context.theme.textTheme.bodyLarge!.copyWith(
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
    );
  }
}
