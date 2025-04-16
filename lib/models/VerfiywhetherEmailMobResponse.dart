class VerfiywhetherEmailMobResponse {
  bool? success;
  int? code;
  String? message;
  Data? data;

  VerfiywhetherEmailMobResponse(
      {this.success, this.code, this.message, this.data});

  VerfiywhetherEmailMobResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? cultureId;

  Data({this.id, this.cultureId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cultureId = json['culture_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['culture_id'] = this.cultureId;
    return data;
  }
}
