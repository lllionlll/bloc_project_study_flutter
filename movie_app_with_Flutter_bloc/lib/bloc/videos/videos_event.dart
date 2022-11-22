part of 'videos_bloc.dart';

abstract class VideosEvent extends Equatable {
  const VideosEvent();

  @override
  List<Object> get props => [];
}

class GetVideos extends VideosEvent {
  final String movieId;

  const GetVideos(this.movieId);
}
