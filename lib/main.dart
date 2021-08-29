import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rafflesys_hugo/app/config/routers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rifa de Fralda do Hugo!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: routers,
    );
  }
}
