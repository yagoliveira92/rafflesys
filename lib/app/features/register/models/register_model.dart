import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:rafflesys_hugo/app/features/home_page/models/name_model.dart';

class RegisterModel {
  String email;
  String nome;
  List<NameModel> nomesSelecionados;
  bool status;
  RegisterModel({
    required this.email,
    required this.nome,
    required this.nomesSelecionados,
    required this.status,
  });

  RegisterModel copyWith({
    String? email,
    String? nome,
    List<NameModel>? nomesSelecionados,
    bool? status,
  }) {
    return RegisterModel(
      email: email ?? this.email,
      nome: nome ?? this.nome,
      nomesSelecionados: nomesSelecionados ?? this.nomesSelecionados,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'nome': nome,
      'nomes_selecionados': nomesSelecionados.map((x) => x.toMap()).toList(),
      'status': false,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      email: map['email'],
      nome: map['nome'],
      nomesSelecionados: List<NameModel>.from(
          map['nomesSelecionados']?.map((x) => NameModel.fromMap(x, ''))),
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) =>
      RegisterModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RegisterModel(email: $email, nome: $nome, nomesSelecionados: $nomesSelecionados, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterModel &&
        other.email == email &&
        other.nome == nome &&
        listEquals(other.nomesSelecionados, nomesSelecionados) &&
        other.status == status;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        nome.hashCode ^
        nomesSelecionados.hashCode ^
        status.hashCode;
  }
}
