class VideoGame {
  final int id;
  final String name;
  final String backgroundImage;

  VideoGame(this.id, this.name, this.backgroundImage);

  factory VideoGame.fromJson(Map<String, dynamic> json) {
    return VideoGame(
      json['id'] ?? 0,
      json['name'] ?? '',
      json['background_image'] ?? '',
    );
  }
}