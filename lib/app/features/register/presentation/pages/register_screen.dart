import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rafflesys_hugo/app/features/home_page/models/name_model.dart';
import 'package:rafflesys_hugo/app/features/home_page/presentation/widgets/name_item_widget.dart';
import 'package:rafflesys_hugo/app/features/register/presentation/widgets/form_register_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({required this.selectedNames, Key? key})
      : super(key: key);

  final List<NameModel> selectedNames;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.blue, //change your color here
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Registrar na Rifa',
          style: GoogleFonts.dancingScript(
            color: Colors.blue[700],
            fontSize: 26,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Você selecionou o(s) nome(s): ',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Center(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: this.selectedNames.length,
                  itemBuilder: (BuildContext context, int index) {
                    return NameItemWidget(
                      key: Key(this.selectedNames[index].id),
                      nameModel: this.selectedNames[index],
                      isSelected: (bool) {},
                      onlyRead: true,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Para ajudar, vamos deixar uma tabela referente aos valores '
                          'de fralda disponíveis. Estão divididos por tamanho: ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    TextSpan(
                      text: '\'P\', \'M\' e \'G\'',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                margin: EdgeInsets.all(10.0),
                color: Colors.blue.withOpacity(0.15),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'P',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'R\$20,00',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'M',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'R\$30,00',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'G',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'R\$40,00',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Abaixo, preencha o formulário e '
                          'o valor que deseja participar. '
                          'O mesmo não pode ser menor do que',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    TextSpan(
                      text: ' o menor valor de fralda da tabela.',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              FormRegisterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
