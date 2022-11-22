import 'package:movies_app/data/models/video_model.dart';

class VideosResultModel {
  final List<VideoModel> videos;
  const VideosResultModel({required this.videos});
  factory VideosResultModel.fromJson(Map<String, dynamic> json) {
    final List<VideoModel> videos = List<VideoModel>.from(
        json['results'].map((json) => VideoModel.fromJson(json)));
    return VideosResultModel(videos: videos);
  }
}
