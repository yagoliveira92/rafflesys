import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessRegisterScreen extends StatelessWidget {
  const SuccessRegisterScreen({
    Key? key,
    required this.nameParticipant,
  }) : super(key: key);

  final String nameParticipant;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
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
                fontSize: 26.0,
              ),
            ),
          ),
          body: Container(
            margin: EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontSize: 25,
                      ),
                      children: [
                        TextSpan(
                          text: 'Obrigado, ',
                        ),
                        TextSpan(
                            text: '$nameParticipant!',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      children: [
                        TextSpan(
                            text: 'Agora basta escolher a forma de'
                                ' pagamento abaixo e '),
                        TextSpan(
                            text: 'enviar o comprovante para nosso email:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'yagoliveira92@gmail.com',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  )
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async => false);
  }
}
