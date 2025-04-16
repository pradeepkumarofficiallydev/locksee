class SignUpEmailMobileVerificationResponse {
  bool? success;
  int? code;
  String? message;
  Data? data;

  SignUpEmailMobileVerificationResponse(
      {this.success, this.code, this.message, this.data});

  SignUpEmailMobileVerificationResponse.fromJson(Map<String, dynamic> json) {
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
  String? email;
  String? phoneNumber;

  Data({this.email, this.phoneNumber});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}
