// To parse this JSON data, do
//
//     final inventaire = inventaireFromJson(jsonString);

import 'dart:convert';

Inventaire inventaireFromJson(String str) => Inventaire.fromJson(json.decode(str));

String inventaireToJson(Inventaire data) => json.encode(data.toJson());


class Inventaire {
  Inventaire({
    required this.numInventaire,
    required this.codeInventaire,
    required this.dateInventaire,
    required this.flagInventaire,
    required this.flagValidInventaire,
    required this.flagAnnuleInventaire,
    required this.createdAt,
    required this.updatedAt,
    required this.idUserC,
    required this.numAgce,
  });

  Inventaire.empty();

  late int numInventaire;
  late String codeInventaire;
  late DateTime dateInventaire;
  late bool flagInventaire;
  late bool flagValidInventaire;
  late bool flagAnnuleInventaire;
  late DateTime createdAt;
  late DateTime updatedAt;
  late String idUserC;
  late String numAgce;

  factory Inventaire.fromJson(Map<String, dynamic> json) => Inventaire(
    numInventaire: json["num_inventaire"],
    codeInventaire: json["code_inventaire"],
    dateInventaire: DateTime.parse(json["date_inventaire"]),
    flagInventaire: json["flag_inventaire"],
    flagValidInventaire: json["flag_valid_inventaire"],
    flagAnnuleInventaire: json["flag_annule_inventaire"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    idUserC: json["id_user_c"],
    numAgce: json["num_agce"],
  );

  Map<String, dynamic> toJson() => {
    "num_inventaire": numInventaire,
    "code_inventaire": codeInventaire,
    "date_inventaire": "${dateInventaire.year.toString().padLeft(4, '0')}-${dateInventaire.month.toString().padLeft(2, '0')}-${dateInventaire.day.toString().padLeft(2, '0')}",
    "flag_inventaire": flagInventaire,
    "flag_valid_inventaire": flagValidInventaire,
    "flag_annule_inventaire": flagAnnuleInventaire,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "id_user_c": idUserC,
    "num_agce": numAgce,
  };
}
