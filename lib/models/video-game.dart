class VideoGame {
  int id;
  String name;
  String backgroundImage;

  VideoGame({this.id, this.name, this.backgroundImage});

  factory VideoGame.fromJson(Map<String, dynamic> json) {
    return VideoGame(
      id: json['id'],
      name: json['name'],
      backgroundImage: json['background_image'],
    );
  }
}