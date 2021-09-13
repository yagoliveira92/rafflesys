import 'package:flutter/material.dart';
import 'package:rafflesys_hugo/app/features/home_page/models/name_model.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({required this.selectedNames, Key? key})
      : super(key: key);

  final List<NameModel> selectedNames;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: this.selectedNames.length,
          itemBuilder: (BuildContext context, int index) {
            return Text('${this.selectedNames[index].name}');
          },
        ),
      ),
    );
  }
}
