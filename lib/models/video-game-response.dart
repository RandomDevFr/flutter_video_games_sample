import 'package:video_games/models/video-game.dart';

class VideoGameResponse {
  List<VideoGame> results;

  VideoGameResponse({this.results});

  factory VideoGameResponse.fromJson(Map<String, dynamic> json) {
    var results = json['results'] as List;
    var videosGames = results.map((videoGameJson) => VideoGame.fromJson(videoGameJson)).toList();
    return VideoGameResponse(
      results: videosGames
    );
  }
}