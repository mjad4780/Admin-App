class NotificationAnalysisModel {
  int? converted;
  int? errored;
  int? failed;
  int? successful;

  NotificationAnalysisModel(
      {this.converted, this.errored, this.failed, this.successful});

  NotificationAnalysisModel.fromJson(Map<String, dynamic> json) {
    converted = json['converted'];
    errored = json['errored'];
    failed = json['failed'];
    successful = json['successful'];
  }
}
