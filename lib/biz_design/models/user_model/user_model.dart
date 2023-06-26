// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  List<String> businessComment;
  List<String> industryConnect;
  List<String> area;
  Map<String, String> career;
  List<String> personSkill;
  String qualification;
  String director;
  String annualIncome;
  String asset;
  String placeOfBirth;
  String hobby;
  String id;

  UserModel({
    required this.businessComment,
    required this.industryConnect,
    required this.area,
    required this.career,
    required this.personSkill,
    required this.qualification,
    required this.director,
    required this.annualIncome,
    required this.asset,
    required this.placeOfBirth,
    required this.hobby,
    required this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        businessComment:
            List<String>.from(json["businessComment"].map((x) => x)),
        industryConnect:
            List<String>.from(json["industryConnect"].map((x) => x)),
        area: List<String>.from(json["area"].map((x) => x)),
        career: Map.from(json["career"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        personSkill: List<String>.from(json["personSkill"].map((x) => x)),
        qualification: json["qualification"],
        director: json["director"],
        annualIncome: json["annualIncome"],
        asset: json["asset"],
        placeOfBirth: json["placeOfBirth"],
        hobby: json["hobby"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "businessComment": List<dynamic>.from(businessComment.map((x) => x)),
        "industryConnect": List<dynamic>.from(industryConnect.map((x) => x)),
        "area": List<dynamic>.from(area.map((x) => x)),
        "career":
            Map.from(career).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "personSkill": List<dynamic>.from(personSkill.map((x) => x)),
        "qualification": qualification,
        "director": director,
        "annualIncome": annualIncome,
        "asset": asset,
        "placeOfBirth": placeOfBirth,
        "hobby": hobby,
        "id": id,
      };
}
