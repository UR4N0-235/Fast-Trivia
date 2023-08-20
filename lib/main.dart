import 'package:fast_trivia/app/app_widget.dart';
import 'package:fast_trivia/db/database_helper.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.database;
  runApp(const AppWidget());
}
