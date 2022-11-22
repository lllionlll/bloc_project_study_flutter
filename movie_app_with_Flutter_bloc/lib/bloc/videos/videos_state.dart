part of 'videos_bloc.dart';

abstract class VideosState extends Equatable {
  const VideosState();

  @override
  List<Object> get props => [];
}

class VideosInitial extends VideosState {}

class VideosLoaded extends VideosState {
  final List<Result> videoList;

  const VideosLoaded({required this.videoList});
}

class VideosFailed extends VideosState {
  final String errorvideoText;

  const VideosFailed({required this.errorvideoText});
}
