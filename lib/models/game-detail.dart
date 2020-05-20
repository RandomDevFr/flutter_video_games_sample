class GameDetail {
  String description;
  String name;
  String backgroundImage;
  String backgroundImageAdditional;

  GameDetail({this.description, this.name, this.backgroundImage, this.backgroundImageAdditional});

  factory GameDetail.fromJson(Map<String, dynamic> json) {
    return GameDetail(
      description: json['description'],
      name: json['name'],
      backgroundImage: json['background_image'],
      backgroundImageAdditional: json['background_image_additional'],
    );
  }
}