class ActorDetailsModel {
  bool? adult;
  String? biography;
  String? birthday;
  var deathday;
  int? gender;
  int? id;
  String? name;
  String? placeOfBirth;
  String? profilePath;

  ActorDetailsModel(
      {this.adult,
      this.biography,
      this.birthday,
      this.deathday,
      this.gender,
      this.id,
      this.name,
      this.placeOfBirth,
      this.profilePath});

  ActorDetailsModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    biography = json['biography'];
    birthday = json['birthday'];
    deathday = json['deathday'];
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    placeOfBirth = json['place_of_birth'];
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['biography'] = biography;
    data['birthday'] = birthday;
    data['deathday'] = deathday;
    data['gender'] = gender;
    data['id'] = id;
    data['name'] = name;
    data['place_of_birth'] = placeOfBirth;
    data['profile_path'] = profilePath;
    return data;
  }
}
