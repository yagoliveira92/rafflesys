import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:rafflesys_hugo/app/features/home_page/models/name_model.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());

  List<NameModel> selectedNames = [];
  List<NameModel> listNames = [];

  Future<void> getAllNames() async {
    final namesDocuments =
        await FirebaseFirestore.instance.collection('nomes').get();
    List<NameModel> listNames = List<NameModel>.from(
      namesDocuments.docs.map(
        (snapshot) => NameModel.fromMap(snapshot.data(), snapshot.id),
      ),
    ).toList();
    this.listNames = listNames;
    emit(
      HomePageSucesso(
        listName: this.listNames,
        selectedNames: this.selectedNames,
      ),
    );
    try {} catch (e) {
      emit(HomePageError());
    }
  }

  Future<void> setSelectedName(
      {required bool add, required NameModel nameModel}) async {
    if (add) {
      this.selectedNames.add(nameModel);
    } else {
      this.selectedNames.remove(nameModel);
    }

    emit(HomePageSucesso(
      listName: this.listNames,
      selectedNames: this.selectedNames,
    ));
  }
}
