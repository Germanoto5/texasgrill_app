import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:texasgrill_app/pages/home/home_page.dart';
import 'package:texasgrill_app/pages/login/login_page.dart';
import 'package:texasgrill_app/pages/sign_in/sign_in_page.dart';

GoRouter createRouter(String initialLocation) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: <RouteBase>[
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: '/signin',
        builder: (BuildContext context, GoRouterState state) {
          return const SignInPage();
        },
      ),
      GoRoute(
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage(title : "");
        },
        /*routes: <GoRoute>[
        ]*/
      ),
    ],
    
  );
}
