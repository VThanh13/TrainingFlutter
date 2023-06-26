// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  List<dynamic> businessComment;
  List<dynamic> industryConnect;
  List<dynamic> area;
  List<dynamic> career;
  List<dynamic> personSkill;
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
            List<dynamic>.from(json["businessComment"].map((x) => x)),
        industryConnect:
            List<dynamic>.from(json["industryConnect"].map((x) => x)),
        area: List<dynamic>.from(json["area"].map((x) => x)),
        career: List<dynamic>.from(json["career"].map((x) => x)),
        personSkill: List<dynamic>.from(json["personSkill"].map((x) => x)),
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
        "career": List<dynamic>.from(career.map((x) => x)),
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
