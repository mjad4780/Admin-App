class NotificationModel {
  String? sId;
  String? title;
  String? body;
  String? userid;
  String? image;
  String? datetime;

  NotificationModel(
      {this.sId,
      this.title,
      this.image,
      this.datetime,
      this.body,
      this.userid});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    sId = json['notification_id '];
    title = json['notification_title'];
    image = json['notification_image'];
    body = json['notification_body'];
    userid = json['notification_userid'];
    image = json['notification_image'];
    datetime = json['notification_datetime'];
  }
}
