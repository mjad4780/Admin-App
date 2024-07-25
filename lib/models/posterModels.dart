class PosterModel {
  String? Id;
  String? title;
  String? body;

  String? image;

  PosterModel({this.Id, this.title, this.image, this.body});

  PosterModel.fromJson(Map<String, dynamic> json) {
    Id = json['setting_id'];
    title = json['setting_title'];
    body = json['setting_body'];

    image = json['setting_image'];
  }
}
