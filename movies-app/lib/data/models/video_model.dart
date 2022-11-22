import 'package:movies_app/domain/entities/video.dart';

class VideoModel extends Video {
  const VideoModel({
    required super.id,
    required super.name,
    required super.key,
    required super.site,
    required super.publishedAt,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'],
      name: json['name'],
      key: json['key'],
      site: json['site'],
      publishedAt: json['publishedAt'],
    );
  }
}
