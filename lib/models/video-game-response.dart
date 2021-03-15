import 'package:video_games/models/video-game.dart';

class VideoGameResponse {
  final List<VideoGame> results;

  VideoGameResponse(this.results);

  factory VideoGameResponse.fromJson(Map<String, dynamic> json) {
    var results = json['results'] ?? <VideoGame>[];
    var videosGames = results.map<VideoGame>((videoGameJson) => VideoGame.fromJson(videoGameJson)).toList();
    return VideoGameResponse(videosGames);
  }
}