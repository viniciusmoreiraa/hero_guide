import 'biography_model.dart';
import 'connections_model.dart';
import 'images_model.dart';
import 'powerstats_model.dart';
import 'appearance_model.dart';
import 'work_model.dart';

class HeroItemModel {
  int id;
  String name;
  String slug;
  PowerstatsModel powerstats;
  AppearanceModel appearance;
  BiographyModel biography;
  WorkModel work;
  ConnectionsModel connections;
  ImagesModel images;

  HeroItemModel(
      {this.id,
      this.name,
      this.slug,
      this.powerstats,
      this.appearance,
      this.biography,
      this.work,
      this.connections,
      this.images});

  HeroItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    powerstats = json['powerstats'] != null
        ? new PowerstatsModel.fromJson(json['powerstats'])
        : null;
    appearance = json['appearance'] != null
        ? new AppearanceModel.fromJson(json['appearance'])
        : null;
    biography = json['biography'] != null
        ? new BiographyModel.fromJson(json['biography'])
        : null;
    work = json['work'] != null ? new WorkModel.fromJson(json['work']) : null;
    connections = json['connections'] != null
        ? new ConnectionsModel.fromJson(json['connections'])
        : null;
    images = json['images'] != null
        ? new ImagesModel.fromJson(json['images'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    if (this.powerstats != null) {
      data['powerstats'] = this.powerstats.toJson();
    }
    if (this.appearance != null) {
      data['appearance'] = this.appearance.toJson();
    }
    if (this.biography != null) {
      data['biography'] = this.biography.toJson();
    }
    if (this.work != null) {
      data['work'] = this.work.toJson();
    }
    if (this.connections != null) {
      data['connections'] = this.connections.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images.toJson();
    }
    return data;
  }
}
