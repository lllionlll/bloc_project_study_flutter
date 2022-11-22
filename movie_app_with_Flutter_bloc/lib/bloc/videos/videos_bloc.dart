import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app_with_bloc/models/videos.dart';
import 'package:http/http.dart' as http;

import '../../api_key/api_key.dart';

part 'videos_event.dart';
part 'videos_state.dart';

class VideosBloc extends Bloc<VideosEvent, VideosState> {
  VideosBloc() : super(VideosInitial()) {
    on<GetVideos>((event, emit) async {
      try {
        String url =
            "https://api.themoviedb.org/3/movie/${event.movieId}/videos?api_key=$apiKey";
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          log('Video response =>${response.body}');
          final videos = Videos.fromJson(jsonDecode(response.body));
          // final videos = videosFromJson(response.body);
          log('Video response =>${response.body}');
          emit(VideosLoaded(videoList: videos.results!));
        }
      } catch (e) {
        // log('Video error=>' + e.toString());

        emit(VideosFailed(errorvideoText: e.toString()));
        throw Exception(e);
      }
    });
  }
}
