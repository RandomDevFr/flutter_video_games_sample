class GameDetail {
  final String description;
  final String name;
  final String backgroundImage;
  final String backgroundImageAdditional;

  GameDetail(this.description, this.name, this.backgroundImage, this.backgroundImageAdditional);

  factory GameDetail.fromJson(Map<String, dynamic> json) {
    return GameDetail(
      json['description'] ?? '',
      json['name'] ?? '',
      json['background_image'] ?? '',
      json['background_image_additional'] ?? '',
    );
  }
}