class Job{
  int? id;
  String? name;
  String? people;
  String? description;

  jobMap(){
    var mapping = <String, dynamic>{};
    mapping['id'] = id;
    mapping['name'] = name!;
    mapping['people'] = people!;
    mapping['description'] = description!;
    return mapping;
  }
}