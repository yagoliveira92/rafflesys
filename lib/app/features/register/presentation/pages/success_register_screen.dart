import 'package:flutter/material.dart';

class SuccessRegisterScreen extends StatelessWidget {
  const SuccessRegisterScreen({
    Key? key,
    required this.nameParticipant,
  }) : super(key: key);

  final String nameParticipant;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Obrigado $nameParticipant!'),
        ],
      ),
    );
  }
}
