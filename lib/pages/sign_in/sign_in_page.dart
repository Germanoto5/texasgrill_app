import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:texasgrill_app/blocs/sign_in/sign_in_bloc.dart';
import 'package:texasgrill_app/mixin/loc_mixin.dart';
import 'package:texasgrill_app/models/user.dart';
import 'package:texasgrill_app/utils/loc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with LocMixin {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnamesController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _rePassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late SignInBloc signInBloc = SignInBloc();

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();
      User user = User();
      user.correo = _emailController.text;
      user.contrasenia = _passController.text;
      user.nombre = _nameController.text;
      user.apellidos = _surnamesController.text;
      signInBloc.add(SignInProcessEvent(user: user));
    }
  }

  void goToLogin(){
    context.go("/login");
  }

  @override
  void dispose(){
    super.dispose();
    signInBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      bloc: signInBloc,
      builder: (context, state) {
        if(state is SignInSuccesState){
          return Scaffold(backgroundColor: Theme.of(context).colorScheme.surface,
          body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Usuario registrado correctamente",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),),
                        const SizedBox(height: 100,),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 20, top: 10),
                            child: Container(
                              height: 80,
                              width: MediaQuery.of(context).size.width * 3 / 4,
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5.0))),
                              child: InkWell(
                                onTap: goToLogin,
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.login,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                      ),
                                      Text(
                                        "Volver al login",
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
                    ],
                  ),
                ),);
        }else{
          return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: Scrollbar(
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 70),
                            child: Text(
                              loc.signin,
                              style: TextStyle(
                                  fontSize: 40,
                                  color:
                                      Theme.of(context).colorScheme.tertiary),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Form(
                              key: _formKey,
                              child: SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 3 / 4,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 50.0),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Datos del usuario",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 30.0),
                                    Container(
                                      padding: const EdgeInsets.only(
                                        bottom: 30,
                                        left: 20,
                                        right: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary, // Color del borde
                                          width: 2.0, // Ancho del borde
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            controller: _nameController,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .tertiary),
                                            decoration: InputDecoration(
                                              suffixIcon:
                                                  const Icon(Icons.person),
                                              suffixIconColor: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                width: 1.0,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .tertiary,
                                              )),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                width: 1.0,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .tertiary,
                                              )),
                                              labelText: loc.name,
                                              labelStyle: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .tertiary),
                                            ),
                                            cursorColor: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'El nombre no puede estar vacio';
                                              } else if (value.length > 100) {
                                                return 'La longitud es demasiado grande';
                                              }
                                              return null;
                                            },
                                          ),
                                          const SizedBox(height: 20.0),
                                          TextFormField(
                                            controller: _surnamesController,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .tertiary),
                                            decoration: InputDecoration(
                                              suffixIcon:
                                                  const Icon(Icons.person),
                                              suffixIconColor: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                width: 1.0,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .tertiary,
                                              )),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                width: 1.0,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .tertiary,
                                              )),
                                              labelText: loc.surnames,
                                              labelStyle: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .tertiary),
                                            ),
                                            cursorColor: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Los apellidos no pueden estar vacios';
                                              } else if (value.length > 100) {
                                                return 'La longitud es demasiado grande';
                                              }
                                              return null;
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 70.0),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Datos de la cuenta",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 30.0),
                                    Container(
                                      padding: const EdgeInsets.only(
                                        bottom: 30,
                                        left: 20,
                                        right: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary, // Color del borde
                                          width: 2.0, // Ancho del borde
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            controller: _emailController,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .tertiary),
                                            decoration: InputDecoration(
                                              suffixIcon: const Icon(Icons
                                                  .alternate_email_outlined),
                                              suffixIconColor: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                width: 1.0,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .tertiary,
                                              )),
                                              focusedBorder:
                                                  UnderlineInputBorder(
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
                                            cursorColor: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'El correo no puede estar vacío';
                                              } else if (value.length > 255) {
                                                return 'La longitud es demasiado grande';
                                              }
                                              if (!value.contains('@')) {
                                                return 'El correo debe contener un @';
                                              }
                                              return null;
                                            },
                                          ),
                                          const SizedBox(height: 20.0),
                                          TextFormField(
                                            controller: _passController,
                                            decoration: InputDecoration(
                                              suffixIcon:
                                                  const Icon(Icons.vpn_key),
                                              suffixIconColor: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                              labelText: loc.password,
                                              labelStyle: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .tertiary),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                width: 1.0,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .tertiary,
                                              )),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                width: 1.0,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .tertiary,
                                              )),
                                            ),
                                            cursorColor: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'La contraseña no puede estar vacía';
                                              } else if (value.length > 255) {
                                                return 'La longitud es demasiado grande';
                                              } else if (value.length < 8) {
                                                return 'La contraseña debe tener al menos 8 caracteres';
                                              }
                                              return null;
                                            },
                                            obscureText: true,
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary,
                                            ),
                                          ),
                                          const SizedBox(height: 20.0),
                                          TextFormField(
                                            controller: _rePassController,
                                            decoration: InputDecoration(
                                              suffixIcon:
                                                  const Icon(Icons.vpn_key),
                                              suffixIconColor: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                              labelText: loc.repassword,
                                              labelStyle: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .tertiary),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                width: 1.0,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .tertiary,
                                              )),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                width: 1.0,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .tertiary,
                                              )),
                                            ),
                                            cursorColor: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'La contraseña no puede estar vacía';
                                              } else {
                                                if (value !=
                                                    _passController.text) {
                                                  return 'Las contraseñas no coinciden';
                                                }
                                              }
                                              return null;
                                            },
                                            obscureText: true,
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20, top: 10),
                            child: Container(
                              height: 80,
                              width: MediaQuery.of(context).size.width * 3 / 4,
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5.0))),
                              child: InkWell(
                                onTap: _submitForm,
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.login,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                      ),
                                      Text(
                                        "Registrarse",
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
                          onPressed: goToLogin,
                          icon: Icon(
                            Icons.login_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          label: Text(
                            "¿Ya tienes cuenta? Inicia sesion.",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      )
                        ],
                      ),
                    ),
                  ),
                ),
        );
        }
        
      },
    );
  }
}
