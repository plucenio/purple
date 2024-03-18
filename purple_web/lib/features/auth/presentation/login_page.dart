import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:purple_web/lib.dart';

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
        children: [
          Flexible(
            flex: 2,
            child: Container(),
          ),
          ViewModelConsumer(
            viewModel: viewModel,
            listener: (context, state) {
              if (state is SuccessLoginState) {
                Modular.to.navigate('/');
                return;
              }
              if (state is LoginErrorState) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(state.errorMessage),
                  ),
                );
                return;
              }
            },
            builder: (final context, final state) => Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: context.theme.highlightColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
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
                          const SizedBox(height: 20),
                          ElevatedButton(
                              child: const Text('Entrar'),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  viewModel.login(
                                    user: User(
                                      username: _emailController.text,
                                      password: _passwordController.text,
                                    ),
                                  );
                                }
                              }),
                          /*const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () async {
                              //Modular.to.pushNamed(CreateAccountPage.route);
                            },
                            child: const Text('Criar conta'),
                          ),
                          const SizedBox(height: 20),
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
