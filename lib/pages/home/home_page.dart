import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:texasgrill_app/blocs/login/login_bloc.dart';
import 'package:texasgrill_app/pages/menu/menu_page.dart';
import 'package:texasgrill_app/pages/promotion/promotions_page.dart';
import 'package:texasgrill_app/widgets/drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      bloc: loginBloc,
      listener: (context, state) {
        if(state is LoginTokenExpiredState || state is LogoutState){
          context.go("/login");
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: Text(
            'Texas Grill Archena',
            style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
          ),
          actions: [
          IconButton(
            icon: Icon(Icons.logout,
            color: Theme.of(context).colorScheme.tertiary ,),
            onPressed: () => loginBloc.add(LogoutUserEvent())),
        ],
          surfaceTintColor: Theme.of(context).colorScheme.tertiary,
          iconTheme: IconThemeData(
            size: 30,
            color: Theme.of(context)
                .colorScheme
                .primary, // Cambia el color del icono aquí
          ),
        ),
        drawer: const DrawerWidget(),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: const <Widget>[
            PromotionsPage(),
            MenuPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease);
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.discount),
              label: 'Promociones',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu),
              label: 'Menú',
            ),
          ],
        ),
      ),
    );
  }
}
