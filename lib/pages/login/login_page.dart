import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:texasgrill_app/blocs/login/login_bloc.dart';
import 'package:texasgrill_app/mixin/loc_mixin.dart';
import 'package:texasgrill_app/models/login.dart';
import 'package:texasgrill_app/utils/loc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LocMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void goToSignIn(){
    context.go("/signin");
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();
      Login login = Login();
      login.correo = _emailController.text;
      login.contrasenia = _passController.text;
      loginBloc.add(LogingUserEvent(login: login));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      bloc: loginBloc,
      listener: (context, state) {
        if (state is LogedState) {
          context.go("/home");
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        bloc: loginBloc,
        builder: (context, state) {
          if (state is LogoutState ||
              state is LogingState ||
              state is LoginErrorState ||
              state is LoginTokenExpiredState) {
            return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.surface,
              body: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 0.0),
                                child: ImageIcon(
                                  const AssetImage(
                                      'assets/images/tga_logo.png'),
                                  size: 270,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Form(
                          key: _formKey,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 3 / 4,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _emailController,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary),
                                  decoration: InputDecoration(
                                    suffixIcon: const Icon(Icons.person),
                                    suffixIconColor:
                                        Theme.of(context).colorScheme.secondary,
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      width: 1.0,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                    )),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      width: 1.0,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                    )),
                                    labelText: loc.mail,
                                    labelStyle: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary),
                                  ),
                                  cursorColor:
                                      Theme.of(context).colorScheme.tertiary,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return loc.emptymail;
                                    }
                                    if (!value.contains('@')) {
                                      return loc.arrobamail;
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 20.0),
                                TextFormField(
                                  controller: _passController,
                                  decoration: InputDecoration(
                                    suffixIcon: const Icon(Icons.vpn_key),
                                    suffixIconColor:
                                        Theme.of(context).colorScheme.secondary,
                                    labelText: loc.password,
                                    labelStyle: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      width: 1.0,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                    )),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      width: 1.0,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                    )),
                                  ),
                                  cursorColor:
                                      Theme.of(context).colorScheme.tertiary,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return loc.emptypassword;
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      _setWidgetState(state),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20, top: 10),
                        child: Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width * 3 / 4,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0))),
                          child: InkWell(
                            onTap: _submitForm,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.login,
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                  Text(
                                    loc.login,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: TextButton.icon(
                          onPressed: goToSignIn,
                          icon: Icon(
                            Icons.open_in_new_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          label: Text(
                            loc.signinbutton,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _setWidgetState(LoginState state) {
    if (state is LogingState) {
      return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: CircularProgressIndicator(
            backgroundColor: Theme.of(context).colorScheme.secondary),
      );
    } else if (state is LoginErrorState) {
      return Padding(
        padding: const EdgeInsets.only(top: 36),
        child: Text(
          state.message,
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
      );
    }

    return const SizedBox(
      height: 56,
    );
  }
}
