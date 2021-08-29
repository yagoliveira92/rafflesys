import 'package:flutter/cupertino.dart';
import 'package:rafflesys_hugo/app/features/home_page/presentation/pages/home_page_screen.dart';

Map<String, Widget Function(BuildContext)> routers = {
  '/': (context) => HomePageScreen(),
};
