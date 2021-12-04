import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'result_state.dart';

class ResultCubit extends Cubit<ResultState> {
  ResultCubit() : super(ResultInitial());

  Future<void> verifyWinner({required String number}) async {
    final namesDocuments = await FirebaseFirestore.instance
        .collection('nomes')
        .where('numero', isEqualTo: int.parse(number))
        .get();
    Map<String, dynamic> nameFounded = namesDocuments.docs.first.data();
    if (!nameFounded['status']) {
      emit(ResultNotFound(nameSelected: nameFounded['nome']));
      return;
    }
    nameFounded['id'] = namesDocuments.docs.first.id;
    nameFounded['status'] = false;
    final participantes =
        FirebaseFirestore.instance.collection('participantes');
    final result = await participantes
        .where("nomes_selecionados", arrayContains: nameFounded)
        .get();
    Map<String, dynamic> winner = result.docs.first.data();
    emit(
      ResultSuccess(
        nameSelected: nameFounded['nome'],
        nameWinner: winner['nome'],
        emailWinner: winner['email'],
      ),
    );
  }
}
