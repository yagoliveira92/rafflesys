import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafflesys_hugo/app/features/home_page/controller/home_page_cubit.dart';
import 'package:rafflesys_hugo/app/features/home_page/presentation/widgets/grid_names_widget.dart';
import 'package:rafflesys_hugo/app/features/home_page/presentation/widgets/sliver_appbar_widget.dart';
import 'package:rafflesys_hugo/app/features/register/presentation/pages/register_screen.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageCubit>(
      create: (context) => HomePageCubit()..getAllNames(),
      child: BlocConsumer<HomePageCubit, HomePageState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            bottomSheet: _bottomSheet(context, state),
            body: _bodyHome(context, state),
          );
        },
      ),
    );
  }

  Widget _bottomSheet(BuildContext context, HomePageState state) {
    if (state is HomePageSucesso) {
      return Container(
        color: Colors.cyan[100],
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  '${state.selectedNames.length} nome(s) selecionado(s)',
                  style: TextStyle(fontSize: 18.0),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: state.selectedNames.isNotEmpty
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  onPressed: () {
                    if (state.selectedNames.isNotEmpty)
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(
                            selectedNames: state.selectedNames,
                          ),
                        ),
                      );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Continuar',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      );
    }
    return SizedBox.shrink();
  }

  Widget _bodyHome(BuildContext context, HomePageState state) {
    if (state is HomePageSucesso) {
      return CustomScrollView(
        slivers: <Widget>[
          SliverAppbarWidget(),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Center(
                child: Text(
                  'Enquanto esperamos sua chegada,'
                  ' que tal ajudar a mamãe e o papai a se prepararem'
                  ' e concorrer a essa lindo presente?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 385.0,
              child: Image.asset('assets/liquidificador.png'),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    'O valor da rifa equivale a um pacote de fralda, que pode'
                    ' ser pago com o mesmo ou com dinheiro. Você escolhe =)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Escolha um ou mais nomes abaixo, a forma de pagamento '
                    'e é só cruzar os dedos!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: GridNamesWidget(
                listName: state.listName,
                function: context.read<HomePageCubit>().setSelectedName),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 50.0,
            ),
          )
        ],
      );
    }
    if (state is HomePageError) {
      return Center(
        child: Text('Erro!'),
      );
    }
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
