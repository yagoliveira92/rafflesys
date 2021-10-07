import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessRegisterScreen extends StatelessWidget {
  const SuccessRegisterScreen({
    Key? key,
    required this.nameParticipant,
  }) : super(key: key);

  final String nameParticipant;

  @override
  Widget build(BuildContext context) {
    final _keyController =
        TextEditingController(text: '1a80763a-57fd-44a1-a476-2209354c12e5');
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
                            text: 'Sua colaboração é muito importante para'
                                ' a chegada do nosso pimpolho.'),
                        TextSpan(
                          text: ' De coração, obrigado.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                  InkWell(
                    onTap: () {
                      Clipboard.setData(
                              ClipboardData(text: 'yagoliveira92@gmail.com'))
                          .then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Email copiada com sucesso!"),
                          ),
                        );
                      });
                    },
                    child: Text(
                      'yagoliveira92@gmail.com',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      children: [
                        TextSpan(text: 'Copie a chave pix '),
                        TextSpan(
                            text: 'clicando no botão ao lado:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 50.0, right: 50.0),
                    child: TextField(
                      controller: _keyController,
                      readOnly: true,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: () {
                            Clipboard.setData(
                                    ClipboardData(text: _keyController.text))
                                .then((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text("Chave Pix copiada com sucesso!"),
                                ),
                              );
                            });
                          },
                          child: Icon(Icons.copy_all),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    height: 350.0,
                    child: Image.asset('assets/pix_qrcode.jpeg'),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      children: [
                        TextSpan(text: 'Para copiar o PicPay basta '),
                        TextSpan(
                            text: 'clicar na imagem:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  InkWell(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: 'yagoliveira92'))
                          .then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("PicPay copiado com sucesso!"),
                          ),
                        );
                      });
                    },
                    child: Container(
                      height: 350.0,
                      child: Image.asset('assets/picpay_qrcode.jpeg'),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async => false);
  }
}
