import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
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
      appBar: PurpleAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          'Purple gestão de studios',
                          style:
                              context.theme.textTheme.headlineLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                            'Em um mundo cada vez mais digital e dinâmico, a eficiência e organização são essenciais para o sucesso de qualquer empreendimento. É com grande entusiasmo que apresentamos Purple, o novo software desenvolvido para simplificar e otimizar a gestão de estúdios de fitness de todas as modalidades. ',
                            style: context.theme.textTheme.bodyMedium),
                        const SizedBox(height: 10),
                        Text(
                            'Gerenciamento Simplificado de Agendamentos e Reservas',
                            style: context.theme.textTheme.titleLarge!
                                .copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Text(
                            'Esqueça as antigas planilhas de agendamento e a confusão na marcação de horários. Com o Purple, você terá à sua disposição uma interface intuitiva e fácil de usar, que permite criar e gerenciar facilmente a agenda de aulas, sessões individuais e eventos especiais. Com atualizações em tempo real e lembretes automáticos, tanto os instrutores quanto os clientes terão uma experiência de agendamento simples e eficaz.',
                            style: context.theme.textTheme.bodyMedium),
                        const SizedBox(height: 10),
                        Text('Análises Detalhadas de Desempenho',
                            style: context.theme.textTheme.titleLarge!
                                .copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Text(
                            'Com o Purple, você terá acesso a análises detalhadas sobre o desempenho do seu estúdio, desde a frequência de clientes até a taxa de ocupação das aulas. Essas informações valiosas ajudarão você a identificar tendências, identificar áreas de melhoria e tomar decisões estratégicas para impulsionar o crescimento do seu negócio.',
                            style: context.theme.textTheme.bodyMedium),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
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
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Colors.purple.withOpacity(0.3),
                                Colors.blue.withOpacity(0.3),
                              ]),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: (state is LoadingLoginState)
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
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
                                                color:
                                                    context.theme.primaryColor),
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
                                                color:
                                                    context.theme.primaryColor),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      ElevatedButton(
                                          child: const Text('Entrar'),
                                          onPressed: () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              viewModel.login(
                                                login: Login(
                                                  username:
                                                      _emailController.text,
                                                  password:
                                                      _passwordController.text,
                                                ),
                                              );
                                            }
                                          }),
                                      const SizedBox(height: 10),
                                      ElevatedButton(
                                        onPressed: () async {
                                          Nav.pushNamed(
                                              AuthModule.createAccount);
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
          ),
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    Colors.purple.shade200,
                    Colors.blue.shade200,
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
