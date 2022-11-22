import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/video.dart';

class WatchVideosArguments extends Equatable {
  final List<Video> videos;
  const WatchVideosArguments({required this.videos});

  @override
  List<Object?> get props => [videos];
}
