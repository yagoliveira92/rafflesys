import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rafflesys_hugo/app/features/home_page/models/name_model.dart';
import 'package:rafflesys_hugo/app/features/home_page/presentation/widgets/name_item_widget.dart';
import 'package:rafflesys_hugo/app/features/register/controller/register_cubit.dart';
import 'package:rafflesys_hugo/app/features/register/presentation/pages/success_register_screen.dart';
import 'package:rafflesys_hugo/app/features/register/presentation/widgets/alert_name_selected_widget.dart';
import 'package:rafflesys_hugo/app/features/register/presentation/widgets/form_register_widget.dart';
import 'package:rafflesys_hugo/app/features/register/presentation/widgets/table_diaper_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({required this.selectedNames, Key? key}) : super(key: key);

  final List<NameModel> selectedNames;
  static var _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: '');
  final _emailController = TextEditingController(text: '');
  final _valueController = TextEditingController(text: '');

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
            fontSize: 26.0,
          ),
        ),
      ),
      body: BlocProvider<RegisterCubit>(
        create: (context) =>
            RegisterCubit()..initRegister(listNames: this.selectedNames),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SuccessRegisterScreen(nameParticipant: state.name),
                ),
                (r) => false,
              );
            }

            if (state is RegisterNameHasSelected) {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) =>
                    AlertNameSelected(names: state.name),
              );
            }
          },
          builder: (context, state) {
            return Container(
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
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    TableDiaperWidget(),
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                        children: [
                          TextSpan(
                            text: 'Abaixo, preencha o formulário e '
                                'o valor que deseja participar. '
                                'O mesmo não pode ser menor do que',
                          ),
                          TextSpan(
                            text: ' o menor valor de fralda da tabela.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    FormRegisterWidget(
                      controllerEmail: _emailController,
                      controllerNome: _nameController,
                      controllerValor: _valueController,
                      formKey: _formKey,
                      numberNames: selectedNames.length,
                      validator: (texto) {
                        context
                            .read<RegisterCubit>()
                            .validateField(key: _formKey);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: state is RegisterButtonAllow ||
                                state is RegisterLoading
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      onPressed: () {
                        if (state is RegisterButtonAllow) {
                          context.read<RegisterCubit>().registerParticipant(
                              name: _nameController.text,
                              email: _emailController.text,
                              value: _valueController.text);
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: state is RegisterLoading
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'Inscrever-se',
                                style: TextStyle(fontSize: 18.0),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
