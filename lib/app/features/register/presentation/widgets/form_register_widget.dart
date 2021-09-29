import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class FormRegisterWidget extends StatelessWidget {
  FormRegisterWidget({
    required this.numberNames,
    required this.controllerEmail,
    required this.controllerNome,
    required this.controllerValor,
    required this.validator,
    required this.formKey,
    Key? key,
  }) : super(key: key);

  final TextEditingController controllerEmail;
  final TextEditingController controllerNome;
  final TextEditingController controllerValor;
  final Function(String) validator;
  FocusNode? _focusNode;
  final GlobalKey formKey;
  final regexEmail = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  final regexValue = RegExp(r'[^0-9]');

  final int numberNames;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: this.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: this.controllerNome,
            decoration: InputDecoration(
              labelText: "Nome",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(),
              ),
            ),
            focusNode: _focusNode,
            keyboardType: TextInputType.name,
            onChanged: this.validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Este campo é obrigatório';
              }
              if (value.length < 3) {
                return 'O nome precisa ter, no mínimo, três letras';
              }
              return null;
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: this.controllerEmail,
            focusNode: _focusNode,
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(),
              ),
            ),
            onChanged: this.validator,
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (!regexEmail.hasMatch(value ?? '')) {
                return "Precisa de um email válido";
              }
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: this.controllerValor,
            focusNode: _focusNode,
            onChanged: this.validator,
            decoration: InputDecoration(
              labelText: "Valor",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(),
              ),
            ),
            validator: (value) {
              if (value != null && value.isNotEmpty) {
                final parsedValue =
                    double.tryParse(value.replaceAll(regexValue, ''));
                if (parsedValue != null &&
                    (parsedValue / 100 < (20.0 * this.numberNames))) {
                  return 'O valor não pode ser menor do que R\$${20.0 * this.numberNames}';
                }
              }
            },
            inputFormatters: <TextInputFormatter>[
              CurrencyTextInputFormatter(
                  decimalDigits: 2, symbol: 'R\$', locale: 'pt-br'),
            ],
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.numberWithOptions(
              decimal: true,
            ),
          ),
        ],
      ),
    );
  }
}
