import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rafflesys_hugo/app/features/home_page/models/name_model.dart';
import 'package:rafflesys_hugo/app/features/register/models/register_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  List<NameModel> selectedNames = [];
  List<String> listNames = [];

  Future<void> initRegister({required List<NameModel> listNames}) async {
    this.selectedNames = listNames;
  }

  void validateField({required GlobalKey<FormState> key}) {
    if (key.currentState!.validate()) {
      emit(RegisterButtonAllow());
    } else {
      emit(RegisterButtonDenied());
    }
  }

  Future<void> registerParticipant(
      {required String name,
      required String email,
      required String value}) async {
    emit(RegisterLoading());
    final participants = FirebaseFirestore.instance.collection('participantes');
    final register = RegisterModel(
        email: email,
        nome: name,
        nomesSelecionados: this.selectedNames,
        valor: value,
        status: false);
    final result = await _updateSelectedNames(names: this.selectedNames);
    if (result) {
      emit(
        RegisterNameHasSelected(name: this.listNames),
      );
    } else {
      await participants.add(register.toMap());
      emit(RegisterSuccess(name: name));
    }
  }

  Future<bool> _updateSelectedNames({required List<NameModel> names}) async {
    final allNames = FirebaseFirestore.instance.collection('nomes');

    for (var index in names) {
      var nameObj = await allNames.doc(index.id).get();
      final mapDoc = nameObj.data();
      if (mapDoc != null) {
        var name = NameModel.fromMap(mapDoc, '');
        if (!name.status) {
          await allNames.doc(index.id).update({'status': true});
        } else {
          this.listNames.add(index.name);
        }
      }
    }
    return this.listNames.length > 0;
  }
}
