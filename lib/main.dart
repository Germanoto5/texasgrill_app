import 'package:flutter/material.dart';
import 'package:texasgrill_app/app.dart';

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();

 // await loginBloc.initLogin();
}

void main() {
  runApp(const MyApp());
}

