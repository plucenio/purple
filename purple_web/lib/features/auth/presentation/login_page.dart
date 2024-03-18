import 'package:flutter/material.dart';
import 'package:purple_web/lib.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        children: [
          Flexible(
            flex: 2,
            child: Container(),
          ),
          Flexible(
            flex: 1,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                      return (value ?? '').isEmpty ||
                              (!(value ?? '').contains('@') ||
                                  !(value ?? '').contains('.com'))
                          ? 'Email inválido'
                          : null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.lock),
                      labelText: 'Senha',
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
                      child: const Text('Entrar'),
                      onPressed: () async {
                        //if (_formKey.currentState!.validate()) {
                        //  context.read<LoginCubit>().signIn(
                        //      emailController.text, passwordController.text);
                        //}
                      }),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      //Modular.to.pushNamed(CreateAccountPage.route);
                    },
                    child: const Text('Criar conta'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      //if (_formKey.currentState!.validate()) {
                      //  if (_formKey.currentState!.validate()) {
                      //    context
                      //        .read<LoginCubit>()
                      //        .forget(emailController.text);
                      //  }
                      //}
                    },
                    child: const Text('Esqueci minha senha'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
