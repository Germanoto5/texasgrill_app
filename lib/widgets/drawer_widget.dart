import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texasgrill_app/blocs/login/login_bloc.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: Column(
                    children: [
                      ImageIcon(
                        const AssetImage('assets/images/tga_logo.png'),
                        size: 120,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            iconColor: Theme.of(context).colorScheme.tertiary,
            leading: const Icon(
              Icons.storefront_outlined,
              size: 30,
            ),
            title: Text(
              'Sobre nosotros',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary, fontSize: 20),
            ),
            onTap: () {
              // Acción al seleccionar Home
              Navigator.pop(context); // Cierra el Drawer
            },
          ),
          const Expanded(child: SizedBox()),
          BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
            if (state is LogedState) {
              return Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                      color: Theme.of(context).colorScheme.secondary,
                      child: Column(
                        children: [
                          Text(
                            '${state.user.nombre!.toUpperCase()} ${state.user.apellidos!.toUpperCase()}',
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.tertiary,
                                fontSize: 16),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            state.user.correo!,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.tertiary,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox();
            }
          }),
        ],
      ),
    );
  }
}
