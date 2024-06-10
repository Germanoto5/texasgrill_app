import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:texasgrill_app/blocs/login/login_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:texasgrill_app/resources/app_theme.dart';
import 'package:texasgrill_app/routes/routes.dart';

class TexasGrillApp extends StatefulWidget {
  const TexasGrillApp({super.key});

  @override
  State<TexasGrillApp> createState() => _TexasGrillAppState();
}

class _TexasGrillAppState extends State<TexasGrillApp> {
  late GoRouter router;
  @override
  void initState() {
    super.initState();
    router = _getInitialRoute();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => loginBloc),
        
        ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
        theme: defaultTheme(),
      ),
    );
  }

  GoRouter _getInitialRoute() {
    if (loginBloc.state is LogedState) {
      return createRouter("/home");
    } else {
      return createRouter("/login");
    }
  }
}


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const HomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }