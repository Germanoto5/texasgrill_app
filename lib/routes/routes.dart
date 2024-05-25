import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:texasgrill_app/pages/login/login_page.dart';

GoRouter createRouter(String initialLocation) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: <RouteBase>[
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
        /*routes: <GoRoute>[
        ]*/
      ),
    ],
    
  );
}
