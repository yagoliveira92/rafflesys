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

  Future<void> initRegister({required List<NameModel> listNames}) async {
    this.selectedNames = listNames;
  }

  void validateField({required GlobalKey<FormState> key}) {
    if (key.currentState!.validate()) {
      emit(RegisterButtonAllow());
    }
  }

  Future<void> registerParticipant(
      {required String name,
      required String email,
      required String value}) async {
    final participants = FirebaseFirestore.instance.collection('participantes');
    final register = RegisterModel(
        email: email,
        nome: name,
        nomesSelecionados: this.selectedNames,
        status: false);
    await _updateSelectedNames(names: this.selectedNames);
    await participants.add(register.toMap());
    emit(RegisterSuccess(name: name));
  }

  Future<void> _updateSelectedNames({required List<NameModel> names}) async {
    final allNames = FirebaseFirestore.instance.collection('nomes');

    names.forEach((element) async {
      await allNames.doc(element.id).update({'status': true});
    });
  }
}
