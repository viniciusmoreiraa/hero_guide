class AppearanceModel {
  String gender;
  String race;
  List<String> height;
  List<String> weight;
  String eyeColor;
  String hairColor;

  AppearanceModel(
      {this.gender,
      this.race,
      this.height,
      this.weight,
      this.eyeColor,
      this.hairColor});

  AppearanceModel.fromJson(Map<String, dynamic> json) {
    gender = json['gender'] ?? 'NA';
    race = json['race'] ?? 'NA';
    height = json['height'].cast<String>();
    weight = json['weight'].cast<String>();
    eyeColor = json['eyeColor'];
    hairColor = json['hairColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gender'] = this.gender;
    data['race'] = this.race;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['eyeColor'] = this.eyeColor;
    data['hairColor'] = this.hairColor;
    return data;
  }
}