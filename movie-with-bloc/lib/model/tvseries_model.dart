class TvSeriesResult {
  bool? adult;
  List<dynamic>? genres;
  String? homepage;
  int? id;
  String? name;
  String? originalName;
  String? overview;
  String? posterPath;
  String? status;
  String? tagline;
  String? type;
  var voteAverage;

  TvSeriesResult({
    this.adult,
    this.genres,
    this.homepage,
    this.id,
    this.name,
    this.originalName,
    this.overview,
    this.posterPath,
    this.status,
    this.tagline,
    this.type,
    this.voteAverage,
  });

  TvSeriesResult.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];

    homepage = json['homepage'];
    id = json['id'];
    name = json['name'];
    genres = json['genre_ids'];
    originalName = json['original_name'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    status = json['status'];
    tagline = json['tagline'];
    type = json['type'];
    voteAverage = json['vote_average'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['homepage'] = homepage;
    data['id'] = id;
    data['name'] = name;
    data['original_name'] = originalName;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['status'] = status;
    data['tagline'] = tagline;
    data['type'] = type;
    data['vote_average'] = voteAverage;
    return data;
  }
}