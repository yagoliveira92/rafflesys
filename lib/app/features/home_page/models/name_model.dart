import 'dart:convert';

class NameModel {
  NameModel({
    required this.id,
    required this.name,
    required this.numero,
    required this.status,
  });

  String id;
  String name;
  int numero;
  bool status;

  NameModel copyWith({
    String? id,
    String? name,
    int? numero,
    bool? status,
  }) {
    return NameModel(
      id: id ?? this.id,
      name: name ?? this.name,
      numero: numero ?? this.numero,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': name,
      'numero': numero,
      'status': status,
    };
  }

  factory NameModel.fromMap(Map<String, dynamic> map, String documentId) {
    return NameModel(
      id: documentId,
      name: map['nome'],
      numero: map['numero'],
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NameModel.fromJson(String source, String documentId) =>
      NameModel.fromMap(json.decode(source), documentId);

  @override
  String toString() {
    return 'NameModel(id: $id, name: $name, numero: $numero, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NameModel &&
        other.id == id &&
        other.name == name &&
        other.numero == numero &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ numero.hashCode ^ status.hashCode;
  }
}
