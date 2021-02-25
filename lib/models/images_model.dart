class ImagesModel {
  String xs;
  String sm;
  String md;
  String lg;

  ImagesModel({this.xs, this.sm, this.md, this.lg});

  ImagesModel.fromJson(Map<String, dynamic> json) {
    xs = json['xs'];
    sm = json['sm'];
    md = json['md'];
    lg = json['lg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['xs'] = this.xs;
    data['sm'] = this.sm;
    data['md'] = this.md;
    data['lg'] = this.lg;
    return data;
  }
}