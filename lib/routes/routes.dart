import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:texasgrill_app/pages/home/home_page.dart';
import 'package:texasgrill_app/pages/login/login_page.dart';
import 'package:texasgrill_app/pages/profile/profile_page.dart';
import 'package:texasgrill_app/pages/promotion/promotion_detail_page.dart';
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
        routes: <GoRoute>[
          GoRoute(
        path: 'me',
        builder: (BuildContext context, GoRouterState state) {
          return const ProfilePage();
        },
      ),
      GoRoute(
        path: 'promotion/:idPromotion',
        builder: (BuildContext context, GoRouterState state) {
          int idPromotion = int.parse(state.pathParameters['idPromotion']!);
          return PromotionDetailPage(idPromotion: idPromotion,);
        },
      ),
        ]
      ),
    ],
    
  );
}
