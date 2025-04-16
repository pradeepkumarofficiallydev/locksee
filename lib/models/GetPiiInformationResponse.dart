class GetPiiInformationResponse {
  bool? success;
  int? code;
  String? message;
  Data? data;

  GetPiiInformationResponse({this.success, this.code, this.message, this.data});

  GetPiiInformationResponse.fromJson(Map<String, dynamic> json) {
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
  int? piiInfoStatus;

  Data({this.piiInfoStatus});

  Data.fromJson(Map<String, dynamic> json) {
    piiInfoStatus = json['pii_info_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pii_info_status'] = this.piiInfoStatus;
    return data;
  }
}
