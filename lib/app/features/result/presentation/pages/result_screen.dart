import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rafflesys_hugo/app/features/result/controller/result_cubit.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController numberController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Sorteio',
          style: GoogleFonts.dancingScript(
            color: Colors.blue[700],
            fontSize: 26.0,
          ),
        ),
      ),
      body: BlocProvider<ResultCubit>(
        create: (context) => ResultCubit(),
        child: BlocConsumer<ResultCubit, ResultState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Digite o número Sorteado:",
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    TextField(
                      controller: numberController,
                      decoration: InputDecoration(
                        labelText: "Número Sorteado",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(22.0, 50.0)),
                      onPressed: () {
                        context
                            .read<ResultCubit>()
                            .verifyWinner(number: numberController.text);
                      },
                      child: Text(
                        "Verificar Ganhador",
                        style: TextStyle(fontSize: 22.0),
                      ),
                    ),
                    _result(context: context, state: state)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _result({required ResultState state, required BuildContext context}) {
    if (state is ResultNotFound) {
      return Container(
        margin: EdgeInsets.only(top: 25.0),
        child: Column(
          children: [
            Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 20.0),
                children: [
                  const TextSpan(text: 'Eita, o nome '),
                  TextSpan(
                      text: state.nameSelected,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const TextSpan(text: ' não foi escolhido por ninguém...')
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            const Text(
              "Tente outro!",
              style: TextStyle(
                fontSize: 22.0,
              ),
            ),
          ],
        ),
      );
    }
    if (state is ResultSuccess) {
      return Container(
        margin: EdgeInsets.only(top: 25.0),
        child: Column(
          children: [
            Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 20.0),
                children: [
                  const TextSpan(text: 'Parabéns '),
                  TextSpan(
                      text: state.nameWinner,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const TextSpan(text: '! Você ganhou o liquidificador!')
                ],
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              'Nome sorteado: ${state.nameSelected}',
              style: TextStyle(
                fontSize: 22.0,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              'Email de contato: ${state.emailWinner}',
              style: TextStyle(
                fontSize: 22.0,
              ),
            ),
          ],
        ),
      );
    }
    return SizedBox.shrink();
  }
}
