import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:purple_web/lib.dart';

import '../auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ViewState<LoginPage, LoginViewmodel> {
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
        title: const Text(APP_NAME),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: Center(child: Lottie.asset('assets/pilates.json')),
          ),
          Flexible(
            flex: 1,
            child: ViewModelConsumer(
              viewModel: viewModel,
              listener: (context, state) {
                if (state is SuccessLoginState) {
                  Nav.pushReplacementNamed(BaseModule.dashboard);
                  return;
                }
                if (state is ErrorLoginState) {
                  if (state.errorMessage.isNotEmpty) {
                    context.showSnackBar(ErrorSnackBar(
                      content: Text(state.errorMessage),
                    ));
                  }
                }
              },
              builder: (final context, final state) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: context.theme.highlightColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: (state is LoadingCreateAccountState)
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
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
                                    return !EmailValidator.validate(value ?? '')
                                        ? 'Email inválido'
                                        : null;
                                  },
                                ),
                                const SizedBox(height: 10),
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
                                      borderSide: BorderSide(
                                          color: context.theme.primaryColor),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                    child: const Text('Entrar'),
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        viewModel.login(
                                          login: Login(
                                            username: _emailController.text,
                                            password: _passwordController.text,
                                          ),
                                        );
                                      }
                                    }),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () async {
                                    Nav.pushNamed(AuthModule.createAccount);
                                  },
                                  child: const Text('Criar conta'),
                                ),
                                /*const SizedBox(height: 20),
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
                          */
                              ],
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
