import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafflesys_hugo/app/features/home_page/controller/home_page_cubit.dart';
import 'package:rafflesys_hugo/app/features/home_page/presentation/widgets/sliver_appbar_widget.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<HomePageCubit>(
        create: (context) => HomePageCubit()..getAllNames(),
        child: BlocConsumer<HomePageCubit, HomePageState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
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
                    child: Center(
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                        ),
                        itemCount: state.listName.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(state.listName[index].name);
                        },
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Text('Será que exibe aqui?'),
                  ),
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
          },
        ),
      ),
    );
  }
}
