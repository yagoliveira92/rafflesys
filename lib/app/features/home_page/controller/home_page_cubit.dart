import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:rafflesys_hugo/app/features/home_page/models/name_model.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());

  Future<void> getAllNames() async {
    final namesDocuments =
        await FirebaseFirestore.instance.collection('nomes').get();
    List<NameModel> listNames = List<NameModel>.from(
      namesDocuments.docs.map(
        (snapshot) => NameModel.fromMap(snapshot.data(), snapshot.id),
      ),
    ).toList();
    print(listNames.length);
    emit(HomePageSucesso(listName: listNames));
    try {} catch (e) {
      emit(HomePageError());
    }
  }
}
