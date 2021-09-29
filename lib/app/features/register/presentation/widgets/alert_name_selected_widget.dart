import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AlertNameSelected extends StatelessWidget {
  const AlertNameSelected({Key? key, required this.names}) : super(key: key);

  final List<String> names;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Ops!'),
      content: Text.rich(
        TextSpan(
          style: TextStyle(fontSize: 16.0),
          children: [
            TextSpan(text: 'Parece que os nomes '),
            TextSpan(
              text: this.names.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(text: ' não estão mais disponíveis. Escolha outros! '),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK, vou escolher'),
        ),
      ],
    );
  }
}
