class MasternotificationlistResponse {
  bool? success;
  int? code;
  String? message;
  NotificationDataWrapper? data;

  MasternotificationlistResponse(
      {this.success, this.code, this.message, this.data});

  MasternotificationlistResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? NotificationDataWrapper.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

// Wrapper class for notification data
class NotificationDataWrapper {
  List<NotificationData>? notifications;
  int? readCount;
  int? unreadCount;
  int? totalCount;

  NotificationDataWrapper({this.notifications, this.readCount, this.unreadCount, this.totalCount});

  NotificationDataWrapper.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      notifications = [];
      json['data'].forEach((v) {
        notifications!.add(NotificationData.fromJson(v));
      });
    }
    readCount = json['readCount'];
    unreadCount = json['unreadCount'];
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.notifications != null) {
      data['data'] = this.notifications!.map((v) => v.toJson()).toList();
    }
    data['readCount'] = readCount;
    data['unreadCount'] = unreadCount;
    data['totalCount'] = totalCount;
    return data;
  }
}

// Individual notification data
class NotificationData {
  int? panelistNotificationId;
  int? panelistId;
  int? masterNotificationId;
  int? notificationReadStatus;
  String? infoId;
  String? createdOn;
  int? partKeyId;
  String? partContent;
  String? partKey;
  CurrDateTime? currDateTime;

  NotificationData(
      {this.panelistNotificationId,
        this.panelistId,
        this.masterNotificationId,
        this.notificationReadStatus,
        this.infoId,
        this.createdOn,
        this.partKeyId,
        this.partContent,
        this.partKey,
        this.currDateTime});

  NotificationData.fromJson(Map<String, dynamic> json) {
    panelistNotificationId = json['panelist_notification_id'];
    panelistId = json['panelist_id'];
    masterNotificationId = json['master_notification_id'];
    notificationReadStatus = json['notification_read_status'];
    infoId = json['info_id'];
    createdOn = json['created_on'];
    partKeyId = json['part_key_id'];
    partContent = json['part_content'];
    partKey = json['part_key'];
    currDateTime = json['CurrDateTime'] != null
        ? CurrDateTime.fromJson(json['CurrDateTime'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['panelist_notification_id'] = panelistNotificationId;
    data['panelist_id'] = panelistId;
    data['master_notification_id'] = masterNotificationId;
    data['notification_read_status'] = notificationReadStatus;
    data['info_id'] = infoId;
    data['created_on'] = createdOn;
    data['part_key_id'] = partKeyId;
    data['part_content'] = partContent;
    data['part_key'] = partKey;
    if (currDateTime != null) {
      data['CurrDateTime'] = currDateTime!.toJson();
    }
    return data;
  }
}

class CurrDateTime {
  int? time;
  String? type;

  CurrDateTime({this.time, this.type});

  CurrDateTime.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['time'] = time;
    data['type'] = type;
    return data;
  }
}
