import 'package:flutter/material.dart';
import 'package:texasgrill_app/blocs/login/login_bloc.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  late LoginBloc loginBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
            ),
            child: Column(
              children: [
                ImageIcon(
                  const AssetImage('assets/images/tga_logo.png'),
                  size: 60,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                Text('german23@gmail.com',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary, fontSize: 20),),
                  Text('German Gomez Carrillo',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary, fontSize: 16),)
              ],
            ),
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
          ListTile(
            iconColor: Theme.of(context).colorScheme.tertiary,
            leading: const Icon(
              Icons.person_outlined,
              size: 30,
            ),
            title: Text(
              'Perfil',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary, fontSize: 20),
            ),
            onTap: () {
              // Acción al seleccionar Home
              Navigator.pop(context); // Cierra el Drawer
            },
          ),
        ],
      ),
    );
  }
}
