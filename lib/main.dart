import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rafflesys_hugo/app/features/home_page/presentation/pages/home_page_screen.dart';
import 'package:rafflesys_hugo/app/features/register/presentation/pages/success_register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Rifa de Fralda do Hugo!',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.blue,
          secondary: Colors.white,
        ),
      ),
      home: HomePageScreen(),
    );
  }
}
