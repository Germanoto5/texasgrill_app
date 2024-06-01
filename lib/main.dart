import 'package:flutter/material.dart';
import 'package:texasgrill_app/app.dart';
import 'package:texasgrill_app/blocs/login/login_bloc.dart';

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();

 await loginBloc.initLogin();
}

void main() async{
  await _init();
  runApp(const TexasGrillApp());
}

