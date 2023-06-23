class UserModel {
  List<String>? businessComment;
  List<String>? industryConnect;
  List<String>? area;
  List<String>? career;
  List<String>? personSkill;
  String? qualification;
  String? director;
  String? annualIncome;
  String? asset;
  String? placeOfBirth;
  String? hobby;
  String? id;

  UserModel(
      {this.businessComment,
      this.industryConnect,
      this.area,
      this.career,
      this.personSkill,
      this.qualification,
      this.director,
      this.annualIncome,
      this.asset,
      this.placeOfBirth,
      this.hobby,
      this.id});

  UserModel.fromJson(Map<String, dynamic> json) {
    businessComment = json['businessComment'];
    industryConnect = json['industryConnect'];
    area = json['area'];
    career = json['career'];
    personSkill = json['personSkill'];
    qualification = json['qualification'];
    director = json['director'];
    annualIncome = json['annualIncome'];
    asset = json['asset'];
    placeOfBirth = json['placeOfBirth'];
    hobby = json['hobby'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['businessComment'] = businessComment;
    data['industryConnect'] = industryConnect;
    data['area'] = area;
    data['career'] = career;
    data['personSkill'] = personSkill;
    data['qualification'] = qualification;
    data['director'] = director;
    data['annualIncome'] = annualIncome;
    data['asset'] = asset;
    data['placeOfBirth'] = placeOfBirth;
    data['hobby'] = hobby;
    data['id'] = id;
    return data;
  }

  userMap() {
    var mapping = <String, dynamic>{};
    mapping['businessComment'] = businessComment!;
    mapping['industryConnect'] = industryConnect!;
    mapping['area'] = area!;
    mapping['career'] = career!;
    mapping['personSkill'] = personSkill!;
    mapping['director'] = director!;
    mapping['annualIncome'] = annualIncome!;
    mapping['asset'] = asset!;
    mapping['placeOfBirth'] = placeOfBirth!;
    mapping['hobby'] = hobby!;
    mapping['id'] = id!;
  }

  Map<String, dynamic> toMap() {
    return {
      'businessComment': businessComment,
      'industryConnect': industryConnect,
      'area': area,
      'career': career,
      'personSkill': personSkill,
      'director': director,
      'annualIncome': annualIncome,
      'asset': asset,
      'placeOfBirth': placeOfBirth,
      'hobby': hobby,
      'id': id,
    };
  }
}
