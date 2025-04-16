class NotififcationResponse {
  bool? success;
  int? code;
  String? message;
  List<Data>? data;

  NotififcationResponse({this.success, this.code, this.message, this.data});

  NotififcationResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? panelistNotificationId;
  dynamic? iconClickTime;
  String? notificationName;

  Data(
      {this.panelistNotificationId, this.iconClickTime, this.notificationName});

  Data.fromJson(Map<String, dynamic> json) {
    panelistNotificationId = json['panelist_notification_id'];
    iconClickTime = json['icon_click_time'];
    notificationName = json['notification_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['panelist_notification_id'] = this.panelistNotificationId;
    data['icon_click_time'] = this.iconClickTime;
    data['notification_name'] = this.notificationName;
    return data;
  }
}
